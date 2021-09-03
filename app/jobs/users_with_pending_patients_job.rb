# frozen_string_literal: true

class UsersWithPendingPatientsJob < ApplicationJob
  def perform
    users_ids.each do |user_id|
      PendingAppointmentsNotificationJob.perform_later(user_id)
    end
  end

  private

    def users_ids
      Enqueue.pending.map do |enqueue|
        next enqueue.user_id if enqueue.due?
      end.uniq.compact
    end
end
