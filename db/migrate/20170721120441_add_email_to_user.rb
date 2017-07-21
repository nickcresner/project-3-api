class AddEmailToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user, :string
    add_column :users, :email, :string
    add_column :users, :image, :string
    add_column :users, :bio, :text
    add_column :users, :facebook_id, :string
  end
end
