class ChangeToDataIncodeToLists < ActiveRecord::Migration[6.0]
  def change
    change_column :lists, :incode, :string
  end
end
