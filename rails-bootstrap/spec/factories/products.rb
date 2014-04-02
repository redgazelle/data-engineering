FactoryGirl.define do
  factory :product do
    description 'bowling balls for $10'
    price 10.0
    association :merchant
  end
end
