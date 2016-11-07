class CreateTagJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_joins do |t|
      t.integer :tag_id, null: false
      t.integer :taggable_id, null: false
      t.string :taggable_type, null: false
      t.index [:taggable_id, :taggable_type, :tag_id], unique: true, 
              name: 'taggable_id to taggable_type to tag_id'
    end
  end
end
