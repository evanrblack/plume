class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|

      t.datetime :start_time_planned, null: false
      t.datetime :start_time
      t.integer :start_method
      t.float :start_latitude
      t.float :start_longitude
      t.datetime :end_time_planned, null: false
      t.datetime :end_time
      t.integer :end_method
      t.float :end_latitude
      t.float :end_longitude

      t.belongs_to :caregiver, null: false
      t.belongs_to :client, null: false

      t.timestamps
    end
  end
end
