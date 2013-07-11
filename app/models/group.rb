class Group < ActiveRecord::Base
  attr_accessible :name, :avatar
  has_many :items

  has_attached_file :avatar, :styles => { :large => '600x600>', :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
