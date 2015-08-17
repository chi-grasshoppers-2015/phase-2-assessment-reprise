class CreateRestaurants < ActiveRecord::Migration
  def change
  	create_table :restaurants do |t|
  		t.string :name, null: false
  		t.string :cuisine
  		t.string :address
  		t.string :city
  		t.string :state
  		t.string :zip
      t.references :creator
  	end
  end
end
