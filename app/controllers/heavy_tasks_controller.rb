class HeavyTasksController < ApplicationController
  def create
    HeavyTaskJob.perform_later(current_user.id)
  end
end
