package im.actor.model.modules.file;

import java.util.ArrayList;

import im.actor.model.FileSystemProvider;
import im.actor.model.droidkit.actors.ActorCreator;
import im.actor.model.droidkit.actors.ActorRef;
import im.actor.model.droidkit.actors.Props;
import im.actor.model.droidkit.actors.messages.PoisonPill;
import im.actor.model.entity.FileLocation;
import im.actor.model.files.FileReference;
import im.actor.model.log.Log;
import im.actor.model.modules.Modules;
import im.actor.model.modules.utils.ModuleActor;
import im.actor.model.modules.utils.RandomUtils;
import im.actor.model.storage.KeyValueEngine;
import im.actor.model.viewmodel.FileCallback;

/**
 * Created by ex3ndr on 26.02.15.
 */
public class DownloadManager extends ModuleActor {

    private static final String TAG = "DownloadManager";
    private static final int SIM_MAX_DOWNLOADS = 2;

    private ArrayList<QueueItem> queue = new ArrayList<QueueItem>();

    private KeyValueEngine<Downloaded> downloaded;

    public DownloadManager(Modules messenger) {
        super(messenger);
    }

    @Override
    public void preStart() {
        super.preStart();
        downloaded = modules().getFilesModule().getDownloadedEngine();
    }

    private QueueItem findItem(long id) {
        for (QueueItem q : queue) {
            if (q.fileLocation.getFileId() == id) {
                return q;
            }
        }
        return null;
    }

    private void promote(long id) {
        for (QueueItem q : queue) {
            if (q.fileLocation.getFileId() == id) {
                if (!q.isStarted) {
                    queue.remove(q);
                    queue.add(0, q);
                }
                return;
            }
        }
    }

    // Tasks

    public void bindDownload(final FileLocation fileLocation, boolean autoStart, FileCallback callback) {
        Log.d(TAG, "Binding file #" + fileLocation.getFileId());
        Downloaded downloaded1 = downloaded.getValue(fileLocation.getFileId());
        if (downloaded1 != null) {
            FileSystemProvider provider = modules().getConfiguration().getFileSystemProvider();
            FileReference reference = provider.fileFromDescriptor(downloaded1.getDescriptor());
            if (reference.isExist() && reference.getSize() == downloaded1.getFileSize()) {
                Log.d(TAG, "- Downloaded");
                callback.onDownloaded(modules().getConfiguration().getFileSystemProvider()
                        .fileFromDescriptor(downloaded1.getDescriptor()));
                return;
            } else {
                Log.d(TAG, "- File is corrupted");
                downloaded.removeItem(downloaded1.getFileId());
            }
        }

        QueueItem queueItem = findItem(fileLocation.getFileId());
        if (queueItem == null) {
            Log.d(TAG, "- Adding to queue");

            queueItem = new QueueItem(fileLocation);
            queueItem.callbacks.add(callback);

            if (autoStart) {
                queueItem.isStopped = false;
                callback.onDownloading(0);
            } else {
                queueItem.isStopped = true;
                callback.onNotDownloaded();
            }

            queue.add(0, queueItem);
        } else {
            Log.d(TAG, "- Promoting in queue");

            promote(fileLocation.getFileId());

            if (queueItem.isStopped) {
                callback.onNotDownloaded();
            } else {
                if (queueItem.isStarted) {
                    callback.onDownloading(queueItem.progress);
                } else {
                    callback.onDownloading(0);
                }
            }
        }

        checkQueue();
    }

    public void startDownload(FileLocation fileLocation) {
        Log.d(TAG, "Starting download #" + fileLocation.getFileId());
        QueueItem queueItem = findItem(fileLocation.getFileId());
        if (queueItem == null) {
            Log.d(TAG, "- Adding to queue");
            queueItem = new QueueItem(fileLocation);
            queueItem.isStopped = false;
            queue.add(0, queueItem);
        } else {
            Log.d(TAG, "- Promoting in queue");
            if (queueItem.isStopped) {
                queueItem.isStopped = false;
                for (FileCallback callback : queueItem.callbacks) {
                    callback.onDownloading(0);
                }
            }
            promote(fileLocation.getFileId());
        }
    }

    public void cancelDownload(long fileId) {
        Log.d(TAG, "Stopping download #" + fileId);
        QueueItem queueItem = findItem(fileId);
        if (queueItem == null) {
            Log.d(TAG, "- Not present in queue");
        } else {
            if (queueItem.isStarted) {
                Log.d(TAG, "- Stopping actor");
                queueItem.taskRef.send(PoisonPill.INSTANCE);
                queueItem.taskRef = null;
                queueItem.isStarted = false;
            }
            Log.d(TAG, "- Marking as stopped");
            queueItem.isStopped = true;

            for (FileCallback callback : queueItem.callbacks) {
                callback.onNotDownloaded();
            }
        }
    }

    public void unbindDownload(long fileId, boolean autoCancel, FileCallback callback) {
        Log.d(TAG, "Unbind file #" + fileId);
        QueueItem queueItem = findItem(fileId);
        if (queueItem == null) {
            Log.d(TAG, "- Not present in queue");
        } else {
            if (autoCancel) {
                if (queueItem.isStarted) {
                    Log.d(TAG, "- Stopping actor");
                    queueItem.taskRef.send(PoisonPill.INSTANCE);
                    queueItem.taskRef = null;
                    queueItem.isStarted = false;
                }

                if (!queueItem.isStopped) {
                    Log.d(TAG, "- Marking as stopped");
                    queueItem.isStopped = true;

                    for (FileCallback c : queueItem.callbacks) {
                        if (c != callback) {
                            c.onNotDownloaded();
                        }
                    }
                }
                queue.remove(queueItem);
            } else {
                Log.d(TAG, "- Removing callback");
                queueItem.callbacks.remove(callback);
            }
        }
    }

    private void checkQueue() {
        Log.d(TAG, "- Checking queue");

        int activeDownloads = 0;
        for (QueueItem queueItem : queue) {
            if (queueItem.isStarted) {
                activeDownloads++;
            }
        }

        if (activeDownloads >= SIM_MAX_DOWNLOADS) {
            Log.d(TAG, "- Already have max number of simultaneous downloads");
            return;
        }

        QueueItem pendingQueue = null;
        for (QueueItem queueItem : queue) {
            if (!queueItem.isStarted && !queueItem.isStopped) {
                pendingQueue = queueItem;
                break;
            }
        }
        if (pendingQueue == null) {
            Log.d(TAG, "- No work for downloading");
            return;
        }

        Log.d(TAG, "- Starting download file #" + pendingQueue.fileLocation.getFileId());

        pendingQueue.isStarted = true;

        final QueueItem finalPendingQueue = pendingQueue;
        pendingQueue.taskRef = system().actorOf(Props.create(DownloadTask.class, new ActorCreator<DownloadTask>() {
            @Override
            public DownloadTask create() {
                return new DownloadTask(finalPendingQueue.fileLocation, self(), modules());
            }
        }), "actor/download/task_" + RandomUtils.nextRid());
    }

    // Queue processing

    public void onDownloadProgress(long fileId, float progress) {
        Log.d(TAG, "onDownloadProgress file #" + fileId + " " + progress);
        QueueItem queueItem = findItem(fileId);
        if (queueItem == null) {
            return;
        }

        queueItem.progress = progress;

        for (FileCallback fileCallback : queueItem.callbacks) {
            fileCallback.onDownloading(progress);
        }
    }

    public void onDownloaded(long fileId, FileReference reference) {
        Log.d(TAG, "onDownloaded file #" + fileId);
        QueueItem queueItem = findItem(fileId);
        if (queueItem == null) {
            return;
        }

        downloaded.addOrUpdateItem(new Downloaded(queueItem.fileLocation.getFileId(),
                queueItem.fileLocation.getFileSize(), reference.getDescriptor()));

        queue.remove(queueItem);
        queueItem.taskRef.send(PoisonPill.INSTANCE);

        for (FileCallback fileCallback : queueItem.callbacks) {
            fileCallback.onDownloaded(reference);
        }
    }

    public void onDownloadError(long fileId) {
        Log.d(TAG, "onDownloadError file #" + fileId);
        QueueItem queueItem = findItem(fileId);
        if (queueItem == null) {
            return;
        }

        queueItem.taskRef.send(PoisonPill.INSTANCE);
        queueItem.isStopped = true;
        queueItem.isStarted = false;

        for (FileCallback fileCallback : queueItem.callbacks) {
            fileCallback.onNotDownloaded();
        }
    }

    private class QueueItem {
        private FileLocation fileLocation;
        private boolean isStopped;

        private ArrayList<FileCallback> callbacks = new ArrayList<FileCallback>();

        private boolean isStarted;
        private float progress;

        private ActorRef taskRef;

        private QueueItem(FileLocation fileLocation) {
            this.fileLocation = fileLocation;
        }
    }

    // Messages

    @Override
    public void onReceive(Object message) {
        if (message instanceof BindDownload) {
            BindDownload requestDownload = (BindDownload) message;
            bindDownload(requestDownload.getFileLocation(),
                    requestDownload.isAutostart(),
                    requestDownload.getCallback());
        } else if (message instanceof CancelDownload) {
            CancelDownload cancelDownload = (CancelDownload) message;
            cancelDownload(cancelDownload.getFileId());
        } else if (message instanceof UnbindDownload) {
            UnbindDownload unbindDownload = (UnbindDownload) message;
            unbindDownload(unbindDownload.getFileId(), unbindDownload.isAutocancel(), unbindDownload.getCallback());
        } else if (message instanceof StartDownload) {
            StartDownload startDownload = (StartDownload) message;
            startDownload(startDownload.getFileLocation());
        } else if (message instanceof OnDownloadProgress) {
            OnDownloadProgress downloadProgress = (OnDownloadProgress) message;
            onDownloadProgress(downloadProgress.getFileId(), downloadProgress.getProgress());
        } else if (message instanceof OnDownloaded) {
            OnDownloaded onDownloaded = (OnDownloaded) message;
            onDownloaded(onDownloaded.getFileId(), onDownloaded.getReference());
        } else if (message instanceof OnDownloadedError) {
            OnDownloadedError error = (OnDownloadedError) message;
            onDownloadError(error.getFileId());
        } else {
            drop(message);
        }
    }

    public static class BindDownload {
        private FileLocation fileLocation;
        private boolean isAutostart;
        private FileCallback callback;

        public BindDownload(FileLocation fileLocation, boolean isAutostart, FileCallback callback) {
            this.fileLocation = fileLocation;
            this.isAutostart = isAutostart;
            this.callback = callback;
        }

        public FileLocation getFileLocation() {
            return fileLocation;
        }

        public boolean isAutostart() {
            return isAutostart;
        }

        public FileCallback getCallback() {
            return callback;
        }
    }

    public static class StartDownload {
        private FileLocation fileLocation;

        public StartDownload(FileLocation fileLocation) {
            this.fileLocation = fileLocation;
        }

        public FileLocation getFileLocation() {
            return fileLocation;
        }
    }

    public static class CancelDownload {
        private int fileId;
        private FileCallback callback;

        public CancelDownload(int fileId, FileCallback callback) {
            this.fileId = fileId;
            this.callback = callback;
        }

        public int getFileId() {
            return fileId;
        }

        public FileCallback getCallback() {
            return callback;
        }
    }

    public static class UnbindDownload {
        private int fileId;
        private boolean isAutocancel;
        private FileCallback callback;

        public UnbindDownload(int fileId, boolean isAutocancel, FileCallback callback) {
            this.fileId = fileId;
            this.isAutocancel = isAutocancel;
            this.callback = callback;
        }

        public int getFileId() {
            return fileId;
        }

        public FileCallback getCallback() {
            return callback;
        }

        public boolean isAutocancel() {
            return isAutocancel;
        }
    }

    public static class OnDownloadProgress {
        private long fileId;
        private float progress;

        public OnDownloadProgress(long fileId, float progress) {
            this.fileId = fileId;
            this.progress = progress;
        }

        public long getFileId() {
            return fileId;
        }

        public float getProgress() {
            return progress;
        }
    }

    public static class OnDownloaded {
        private long fileId;
        private FileReference reference;

        public OnDownloaded(long fileId, FileReference reference) {
            this.fileId = fileId;
            this.reference = reference;
        }

        public long getFileId() {
            return fileId;
        }

        public FileReference getReference() {
            return reference;
        }
    }

    public static class OnDownloadedError {
        private long fileId;

        public OnDownloadedError(long fileId) {
            this.fileId = fileId;
        }

        public long getFileId() {
            return fileId;
        }
    }
}
