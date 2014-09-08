class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
    	t.belongs_to :test
    	t.string :code
    	t.string :status
    	t.string :description
    	t.string :name
    end
  end
end
