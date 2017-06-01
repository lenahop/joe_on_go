class CreateItems < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.references :order
  		t.string :item_name
  		t.string :item_size 

  		t.timestamp 
  	end

  end
end
