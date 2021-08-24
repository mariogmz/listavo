# frozen_string_literal: true

require "test_helper"

class EnqueueTest < ActiveSupport::TestCase

  attr_reader :enqueue

  setup do
    @enqueue = enqueues(:patient1)
    enqueue.booked_at = nil
  end

  context "validations" do
    should belong_to(:user)
    should belong_to(:patient)
  end

  test "#next_notification_date" do
    notification_days = 15
    enqueue.user.notification_days = notification_days

    expected = enqueue.updated_at + notification_days.days
    assert_equal(expected, enqueue.next_notification_date)

    enqueue.booked_at = Date.today
    assert_nil(enqueue.next_notification_date)
  end

  test "#due?" do
    enqueue.updated_at = 15.days.ago
    enqueue.user.notification_days = 20
    assert_not(enqueue.due?)

    enqueue.user.notification_days = 1
    assert(enqueue.due?)
  end

  test "#book!" do
    now = Time.current
    Time.expects(:current).returns(now)

    enqueue.book!
    assert_equal(now, enqueue.booked_at)
  end

  test "#snooze!" do
    assert_changes ->{ enqueue.updated_at } do
      enqueue.snooze!
    end
  end
end
