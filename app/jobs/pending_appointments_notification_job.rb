# frozen_string_literal: true

class PendingAppointmentsNotificationJob < ApplicationJob
  def perform(user_id)
    user = User.find(user_id)
    EnqueueMailer.notify_patient_dues_email(user).deliver_now
  end
end
