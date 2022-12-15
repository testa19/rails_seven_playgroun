class WelcomeController < ApplicationController
  def index
    @messages = Message.order(created_at: :desc).limit(10)
  end
end
