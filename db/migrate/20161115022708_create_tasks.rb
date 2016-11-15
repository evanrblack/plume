class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :removed_at
      t.belongs_to :client, null: false
      t.timestamps
    end
  end
end
