class AddLegNumberToLegs < ActiveRecord::Migration[5.1]
  def change
    add_column :legs, :leg_number, :integer
  end
end
