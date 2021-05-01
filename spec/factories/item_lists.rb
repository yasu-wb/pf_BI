FactoryBot.define do
  factory :item_list do
    association :item
    association :list
  end
end
