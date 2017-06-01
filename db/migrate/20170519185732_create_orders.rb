class CreateOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  		t.references :user
  		t.references :item

  		t.timestamp 
  	end
  end
end
