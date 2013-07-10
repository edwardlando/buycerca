class AddReasonAndStoryToItems < ActiveRecord::Migration
  def change
  	add_column :items, :reason, :string
  	add_column :items, :story, :string
  end
end
