class HeavyTaskJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    total_count.times do |i|
      sleep rand
      Turbo::StreamsChannel.broadcast_replace_to(
        ["heavy_task_channel", current_user.to_gid_param].join(':'),
        target: "heavy_task",
        partial: "heavy_tasks/progress",
        locals: { progress: (i + 1) * 100 / total_count },
      )
    end
  end

  private

  def total_count
    @total_count ||= rand(10..100)
  end

  def current_user
    # User.find(self.arguments.first)
    @current_user ||= Message.find(self.arguments.first)
  end
end
