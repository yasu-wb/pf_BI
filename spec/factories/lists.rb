FactoryBot.define do
  factory :list do
    incode { FactoryBot.create(:item).incode }
    date { Date.today }
  end
end
