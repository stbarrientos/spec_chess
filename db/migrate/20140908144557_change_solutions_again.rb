class ChangeSolutionsAgain < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		add_column :solutions, :user_id, :integer
  	end
  end
end
