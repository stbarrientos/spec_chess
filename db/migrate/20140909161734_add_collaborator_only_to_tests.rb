class AddCollaboratorOnlyToTests < ActiveRecord::Migration
  def change
  	change_table :tests do |t|
  		add_column :tests, :personal, :boolean
  	end
  end
end
