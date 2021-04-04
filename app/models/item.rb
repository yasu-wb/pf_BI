class Item < ApplicationRecord
  with_options presence: true do
    validates :incode, uniqueness: true
    validates :name
    validates :main_category, :sub_category, numericality: { other_than: 0, message: 'を選択してください' }
  end
  validates :incode, numericality: { only_integer: true, message: '半角数字で入力してください' }
  has_many :item_lists
  has_many :lists, through: :item_lists
  has_many :analyses
end
