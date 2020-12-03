class CreateRestaurantReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.string :comment
      
      t.references :users, foreign_key: true
      t.references :restaurants, foreign_key: true

      t.timestamps
    end
  end
end
