class CreateItemLists < ActiveRecord::Migration[6.0]
  def change
    create_table :item_lists do |t|
      t.references :item, foreign_key: true
      t.references :list, foreign_key: true
      t.timestamps
    end
  end
end
