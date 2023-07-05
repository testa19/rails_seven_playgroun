class SmallTaskJob < ApplicationJob
  queue_as :default

  def perform(user_id, i, total_count)
    current_user = Message.find(user_id)
    sleep rand
    Turbo::StreamsChannel.broadcast_action_to(
      ["heavy_task_channel", current_user.to_gid_param].join(':'),
      action: :append,
      target: "heavy_task",
      content: "<div></div>"
      )
  end
end
