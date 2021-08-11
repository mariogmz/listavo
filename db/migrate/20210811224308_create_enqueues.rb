class CreateEnqueues < ActiveRecord::Migration[6.1]
  def change
    create_table :enqueues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :booked_at, null: false, default: -> { "CURRENT_TIMESTAMP" }

      t.timestamps
    end
  end
end
