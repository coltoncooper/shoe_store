class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
