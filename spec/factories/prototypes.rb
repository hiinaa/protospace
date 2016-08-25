FactoryGirl.define do
  factory :prototype do
    title { Faker::Name.name }
    catch_copy { Faker::Name.name }
    concept { Faker::Lorem.sentence }
    user
  end
end
