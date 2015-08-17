class CreateReviews < ActiveRecord::Migration
  def change
  	create_table :reviews do |t|
  		t.integer :stars
  		t.string :body
  		t.references :reviewer
  		t.references :restaurant
  		t.timestamps
  	end
  end
end
