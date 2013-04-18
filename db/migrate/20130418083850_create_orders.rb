class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :surname
      t.string :middlename
      t.string :address
      t.string :phone
      t.string :comment

      t.timestamps
    end
  end
end
