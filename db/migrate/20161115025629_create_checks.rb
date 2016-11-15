class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.belongs_to :task, null: false
      t.belongs_to :visit, null: false
      t.timestamps
    end
  end
end
