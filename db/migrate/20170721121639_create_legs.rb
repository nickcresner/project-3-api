class CreateLegs < ActiveRecord::Migration[5.1]
  def change
    create_table :legs do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
