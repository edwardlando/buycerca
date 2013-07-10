class Item < ActiveRecord::Base
  attr_accessible :name, :price, :group_id, :group, :avatar, :reason, :story
  belongs_to :group
  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
