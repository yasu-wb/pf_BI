class Item < ApplicationRecord
  with_options presence: true do
    validates :incode, uniqueness: true
    validates :name
    validates :main_category, :sub_category, numericality: { other_than: 0, message: 'Select' }
  end
  validates :incode, numericality: { only_integer: true, message: 'Half-width number' }
end
