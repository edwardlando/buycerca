class AddUsernameAndFacebookEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :facebook_email, :string
  end
end
