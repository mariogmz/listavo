# frozen_string_literal: true

class EnqueueMailer < ApplicationMailer
  def new_patient_email(enqueue)
    @enqueue = enqueue
    @user = enqueue.user
    @patient = enqueue.patient

    subject = I18n.t("enqueue_mailer.new_patient_email.subject", name: @patient.name)
    bootstrap_mail(to: @user.email, subject: subject)
  end
end
