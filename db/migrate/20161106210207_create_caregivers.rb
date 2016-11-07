class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
      # Nameable
      t.string :first_name, null: false
      t.string :last_name, null: false

      # Genderable
      t.integer :gender, null: false

      # Birthdatable
      t.date :birthdate, null: false

      # Phonable
      t.string :phone_number, null: false

      # Emailable
      # taken care of by devise model and delegation

      # Locatable
      t.string :street_address, null: false
      t.string :extra_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.float :latitude
      t.float :longitude

      # Groupable
      t.belongs_to :group

      t.timestamps
    end
  end
end
