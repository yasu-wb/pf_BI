class CreateAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.references :list,        null: false, foreign_key: true
      t.references :item,        null: false, foreign_key: true
      t.time       :datetime,    null: false
      t.string     :tank_no,     null: false
      t.float      :density,     null: false
      t.float      :alcohol,     null: false
      t.float      :extract,     null: false
      t.float      :acid_degree
      t.float      :amino_acid
      t.float      :color
      t.float      :nacl
      t.float      :turbidity
      t.integer    :free_sulfurous_acid
      t.integer    :total_sulfurous_acid
      t.text       :comment
      t.timestamps
    end
  end
end
