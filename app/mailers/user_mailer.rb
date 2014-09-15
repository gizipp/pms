class UserMailer < ActionMailer::Base
  default from: "no-reply@softwareseni.com"

  def notif_task(toemail, task)
    @toemail = toemail
    @task = task
    mail(to: @toemail, subject: 'New task assigned to you!')
  end
end


