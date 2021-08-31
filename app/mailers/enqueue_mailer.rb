# frozen_string_literal: true

class EnqueueMailer < ApplicationMailer
  def new_patient_email(enqueue)
    set_actors(enqueue)

    subject = I18n.t("enqueue_mailer.new_patient_email.subject", name: @patient.name)
    bootstrap_mail(to: @user.email, subject: subject)
  end

  def notify_patient_dues_email(user)
    @user = user
    @enqueues = @user.patients_to_book

    subject = I18n.t("enqueue_mailer.notify_patient_dues_email.subject")
    bootstrap_mail(to: @user.email, subject: subject)
  end

  private

    def set_actors(enqueue)
      @enqueue = enqueue
      @user = enqueue.user
      @patient = enqueue.patient
    end
end
