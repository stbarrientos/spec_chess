class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
    	t.belongs_to :user
    	t.string :code
    	t.string :name
    	t.string :status
    	t.string :description
    end
  end
end
