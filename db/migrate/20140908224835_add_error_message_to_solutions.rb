class AddErrorMessageToSolutions < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		rename_column :solutions, :errors, :error_messages
  	end
  end
end
