class FeedbackMailer < ApplicationMailer
  def user_feedback(user, feedback)
    @user = user
    @feedback = feedback

    mail to: Admin.first.email
  end
end
