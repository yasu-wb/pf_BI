class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :incode,        null: false
      t.string  :name,          null: false
      t.integer :main_category, null: false
      t.integer :sub_category,  null: false
      t.timestamps
    end
  end
end
