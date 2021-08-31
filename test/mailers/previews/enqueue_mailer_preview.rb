# Preview all emails at http://localhost:3000/rails/mailers/enqueue_mailer
class EnqueueMailerPreview < ActionMailer::Preview
  def new_patient_email
    enqueue = Enqueue.first
    EnqueueMailer.new_patient_email(enqueue)
  end

  def notify_patient_dues_email
    user = User.first

    EnqueueMailer.notify_patient_dues_email(user)
  end
end
