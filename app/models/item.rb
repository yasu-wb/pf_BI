class Item < ApplicationRecord
  with_options presence: true do
    validates :incode, uniqueness: true
    validates :name
    validates :main_category_id, :sub_category_id, numericality: { other_than: 0, message: 'を選択してください' }
  end
      validates :incode, numericality: { only_integer: true, message: 'は半角数字で入力してください' }, length: { is: 6, message: 'は6桁で入力してください'}

  has_many :item_lists
  has_many :lists, through: :item_lists
  has_many :analyses

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :main_category
  belongs_to :sub_category
end
