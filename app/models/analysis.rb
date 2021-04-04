class Analysis < ApplicationRecord
  with_options presence: true do
    validates :tank_no
    validates :density, :alcohol, :extract
  end

  belongs_to :item
  belongs_to :list
end
