class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false
      t.integer :category, null: false
      t.timestamps
    end
  end
end
