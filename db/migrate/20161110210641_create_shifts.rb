class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.integer :day, null: false
      t.integer :start_time, null: false
      t.integer :duration, null: false
      t.belongs_to :client, null: false

      t.timestamps
    end
  end
end
