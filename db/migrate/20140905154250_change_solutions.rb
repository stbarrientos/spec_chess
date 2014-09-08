class ChangeSolutions < ActiveRecord::Migration
  def change
  	change_table :solutions do |t|
  		t.rename :dscription, :description
  	end
  end
end
