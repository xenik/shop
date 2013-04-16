class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.string :article
      t.float :weight
      t.float :width
      t.float :length
      t.float :height
      t.float :volume
      t.string :comment
      t.timestamps
    end
  end
end
