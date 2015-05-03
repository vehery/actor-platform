/*
 * Copyright (C) 2015 Actor LLC. <https://actor.im>
 */

package im.actor.model.js.providers;

import com.google.gwt.typedarrays.shared.ArrayBuffer;
import com.google.gwt.typedarrays.shared.TypedArrays;
import com.google.gwt.typedarrays.shared.Uint8Array;

import im.actor.model.files.FileReadCallback;
import im.actor.model.files.InputFile;
import im.actor.model.js.providers.fs.JsFile;
import im.actor.model.js.providers.fs.JsFileLoadedClosure;
import im.actor.model.js.providers.fs.JsFileReader;

public class JsFileInput implements InputFile {

    private JsFile jsFile;

    public JsFileInput(JsFile jsFile) {
        this.jsFile = jsFile;
    }

    @Override
    public void read(final int fileOffset, final byte[] data, final int offset, final int len, final FileReadCallback callback) {
        JsFileReader fileReader = JsFileReader.create();
        fileReader.setOnLoaded(new JsFileLoadedClosure() {
            @Override
            public void onLoaded(ArrayBuffer message) {
                Uint8Array array = TypedArrays.createUint8Array(message);
                byte[] res = new byte[array.length()];
                for (int i = 0; i < res.length; i++) {
                    res[offset + i] = (byte) (array.get(i));
                }
                callback.onFileRead(fileOffset, data, offset, len);
            }
        });
        fileReader.readAsArrayBuffer(jsFile.slice(fileOffset, len));
    }

    @Override
    public boolean close() {
        return true;
    }
}
