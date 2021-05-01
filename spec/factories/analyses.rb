FactoryBot.define do
  factory :analysis do
    tank_no {Faker::Number.number(digits: 4)}
    density {Faker::Number.between(from: 0.0, to: 1.7)}
    alcohol {Faker::Number.between(from: 0.0, to: 99.5)}
    extract {Faker::Number.between(from: 0.0, to: 50.0)}
    acid_degree {Faker::Number.between(from: 0.0, to: 50.0)}
    amino_acid {Faker::Number.between(from: 0.0, to: 30.0)}
    color {Faker::Number.between(from: 0.0, to: 1.5)}
    nacl {Faker::Number.between(from: 0.0, to: 15.0)}
    turbidity {Faker::Number.between(from: 0.0, to: 30.0)}
    free_sulfurous_acid {Faker::Number.between(from: 0.0, to: 100.0)}
    total_sulfurous_acid {Faker::Number.between(from: 0.0, to: 400.0)}
    comment {Faker::Lorem.sentence}
    association :item
    association :list
  end
end
