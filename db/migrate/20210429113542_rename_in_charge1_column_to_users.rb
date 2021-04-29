class RenameInCharge1ColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :in_charge1, :in_charge1_id
    rename_column :users, :in_charge2, :in_charge2_id
    rename_column :users, :in_charge3, :in_charge3_id
  end
end
