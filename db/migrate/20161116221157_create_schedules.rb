class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :week, null: false, default: '0'

      t.integer :schedulable_id, null: false
      t.string :schedulable_type, null: false

      t.timestamps
    end
  end
end
