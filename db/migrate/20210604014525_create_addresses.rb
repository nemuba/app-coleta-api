class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :country
      t.string :zip_code
      t.string :latitude
      t.string :longitude
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
