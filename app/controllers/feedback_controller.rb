class FeedbackController < ApplicationController
  def index; end

  def create
    user = current_user.email
    feedback = params[:feedback]

    FeedbackMailer.user_feedback(user, feedback).deliver_now

    redirect_to root_path
  end
end
