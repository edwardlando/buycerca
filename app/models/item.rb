class Item < ActiveRecord::Base
  attr_accessible :name, :price, :group_id, :group
  belongs_to :group
end
