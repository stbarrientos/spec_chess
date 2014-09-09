class AddOutputTextToSolutions < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		remove_column :solutions, :output
  		add_column :solutions, :output_text, :text
  	end
  end
end
