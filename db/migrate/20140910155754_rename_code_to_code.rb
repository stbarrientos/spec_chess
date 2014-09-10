class RenameCodeToCode < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		remove_column :solutions, :code
  		add_column :solutions, :code, :text
  	end
  	change_table :tests do |s|
  		remove_column :tests, :code
  		add_column :tests, :code, :text
  	end
  end
end
