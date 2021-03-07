class Item < ApplicationRecord
  with_options presence: true do
    validates :incode, :name, :main_category, :sub_category
  end
  
end
