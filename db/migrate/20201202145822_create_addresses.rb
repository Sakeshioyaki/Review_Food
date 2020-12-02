class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :restaurant_id
      t.string :address_name
      
      t.references :restaurants, foreign_key: true
      
      t.timestamps
    end
  end
end
