# frozen_string_literal: true

class UsersWithPendingPatientsJob < ApplicationJob
  def perform
    users_ids.each do |user_id|
      PendingAppointmentsNotificationJob.perform_later(user_id)
    end
  end

  private

    def users_ids
      Enqueue.includes(:user).pending.map do |enqueue|
        next enqueue.user.id if enqueue.due?

        nil
      end.uniq
    end
end
