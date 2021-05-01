FactoryBot.define do
  factory :list do
    association :item
    incode { item.incode }
    date { Date.today }
  end
end
