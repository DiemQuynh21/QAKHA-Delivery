class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :id_card
      t.string :phone_number
      t.string :password
      t.string :license_plate

      t.timestamps
    end
  end
end
