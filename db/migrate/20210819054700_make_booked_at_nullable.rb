# frozen_string_literal: true

class MakeBookedAtNullable < ActiveRecord::Migration[6.1]
  def up
    change_column :enqueues, :booked_at, :datetime, null: true
    change_column_default :enqueues, :booked_at, nil
  end

  def down
    change_column :enqueues, :booked_at, :datetime, null: false
    change_column_default :enqueues, :booked_at, ->{ "CURRENT_TIMESTAMP" }
  end
end
