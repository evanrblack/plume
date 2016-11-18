class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.datetime :removed_at
      t.belongs_to :client, null: false
      t.timestamps
    end
  end
end
