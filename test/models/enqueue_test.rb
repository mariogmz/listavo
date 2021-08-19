# frozen_string_literal: true

require "test_helper"

class EnqueueTest < ActiveSupport::TestCase

  attr_reader :enqueue

  setup do
    @enqueue = enqueues(:patient1)
  end

  context "validations" do
    should belong_to(:user)
    should belong_to(:patient)
  end

  test "#next_notification_date" do
    notification_days = 15
    enqueue.user.notification_days = notification_days
    enqueue.booked_at = nil

    expected = enqueue.created_at + notification_days
    assert_equal(expected, enqueue.next_notification_date)

    enqueue.booked_at = Time.current
    expected = enqueue.booked_at + notification_days
    assert_equal(expected, enqueue.next_notification_date)
  end
end
