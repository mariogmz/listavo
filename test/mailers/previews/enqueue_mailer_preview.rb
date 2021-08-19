# Preview all emails at http://localhost:3000/rails/mailers/enqueue_mailer
class EnqueueMailerPreview < ActionMailer::Preview
  def new_patient_email
    enqueue = Enqueue.first
    EnqueueMailer.new_patient_email(enqueue)
  end
end
