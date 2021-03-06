class CreateManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :managers do |t|
      # Nameable
      t.string :first_name, null: false
      t.string :last_name, null: false

      # Phonable
      t.string :phone_number, null: false

      # Emailable
      # taken care of by devise model and delegation

      # Organization
      t.belongs_to :organization

      t.timestamps
    end
  end
end
