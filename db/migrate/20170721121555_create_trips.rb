class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :country
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :info
      t.string :image

      t.timestamps
    end
  end
end
