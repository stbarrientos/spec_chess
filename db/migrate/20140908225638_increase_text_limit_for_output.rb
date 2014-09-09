class IncreaseTextLimitForOutput < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		remove_column :solutions, :error_messages
  		add_column :solutions, :error_message, :text
  	end
  end
end
