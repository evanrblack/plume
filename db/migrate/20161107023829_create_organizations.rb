class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false

      # Emailable
      t.string :email, null: false

      # Phonable
      t.string :phone_number, null: false

      # Locatable
      t.string :street_address, null: false
      t.string :extra_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.float :latitude
      t.float :longitude

      # Groupable
      t.belongs_to :organization
    end
  end
end
