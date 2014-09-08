class AddOutputToSolutions < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		add_column :solutions, :output, :string
  	end	
  end
end
