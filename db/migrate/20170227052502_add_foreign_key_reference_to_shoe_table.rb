class AddForeignKeyReferenceToShoeTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :shoes, :seller_id, :integer
  	add_column :shoes, :buyer_id, :integer, :allow_nil => true
  end
end
