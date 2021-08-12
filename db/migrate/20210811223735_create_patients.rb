# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone
      t.integer :shift, null: false, default: 0

      t.timestamps
    end
  end
end
