class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.date       :date,   null: false
      t.integer    :incode, null: false
      t.timestamps
    end
  end
end
