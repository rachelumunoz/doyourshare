class CreateLocationRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :location_ratings do |t|
      t.decimal :lat
      t.decimal :long
      t.integer :rating
      t.string :email

      t.timestamps
    end
  end
end
