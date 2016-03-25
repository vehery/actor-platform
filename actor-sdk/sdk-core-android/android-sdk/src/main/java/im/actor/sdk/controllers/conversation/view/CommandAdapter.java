package im.actor.sdk.controllers.conversation.view;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

import im.actor.core.entity.BotCommand;
import im.actor.core.viewmodel.UserVM;
import im.actor.core.viewmodel.generics.ArrayListBotCommands;
import im.actor.runtime.mvvm.Value;
import im.actor.runtime.mvvm.ValueChangedListener;
import im.actor.sdk.R;

public class CommandAdapter extends RecyclerView.Adapter<CommandAdapter.CommandVH> {

    Context context;
    ArrayList<BotCommand> commands = new ArrayList<>();

    public CommandAdapter(UserVM user, Context context) {
        this.context = context;
        user.getBotCommands().subscribe(new ValueChangedListener<ArrayListBotCommands>() {
            @Override
            public void onChanged(ArrayListBotCommands val, Value<ArrayListBotCommands> valueModel) {
                commands.clear();
                commands = new ArrayList<BotCommand>(val);
                notifyDataSetChanged();
            }
        });
    }

    @Override
    public CommandVH onCreateViewHolder(ViewGroup parent, int viewType) {
        return new CommandVH(inflate(R.layout.adapter_commands, parent));
    }

    @Override
    public void onBindViewHolder(CommandVH holder, int position) {
        holder.bind(commands.get(position));
    }

    @Override
    public int getItemCount() {
        return commands.size();
    }

    public class CommandVH extends RecyclerView.ViewHolder {
        BotCommand command;
        TextView commandTv;
        TextView descriptionTv;

        public CommandVH(View itemView) {
            super(itemView);
            commandTv = (TextView) itemView.findViewById(R.id.command);
            descriptionTv = (TextView) itemView.findViewById(R.id.description);
        }

        public void bind(BotCommand command) {
            this.command = command;
            commandTv.setText(command.getSlashCommand());
            descriptionTv.setText(command.getDescription());
        }
    }

    protected View inflate(int id, ViewGroup viewGroup) {
        return LayoutInflater
                .from(context)
                .inflate(id, viewGroup, false);
    }
}
