class UserMailer < ActionMailer::Base
  default from: "no-reply@softwareseni.com"

  def notif_task(toemail, task)
    @toemail = toemail
    @task = task
    mail(to: @toemail, subject: 'New task assigned to you!')
  end

  def welcome_email(user)
    @user = user
    @url  = 'http://pmspms.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to PMS!')
  end
end


