class AddErrorsToSolutions < ActiveRecord::Migration
  def change
  	change_table :solutions do |s|
  		add_column :solutions, :errors, :string
  	end
  end
end
