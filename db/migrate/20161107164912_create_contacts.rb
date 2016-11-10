class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      # Nameable
      t.string :first_name, null: false
      t.string :last_name, null: false

      # Emailable
      t.string :email, null: false

      # Phonable
      t.string :phone_number, null: false

      t.belongs_to :client

      t.timestamps
    end
  end
end
