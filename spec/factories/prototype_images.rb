include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :prototype_image do
    image { fixture_file_upload("spec/fixtures/image/sample.gif") }
    trait :main do
      status :main
    end
    trait :sub do
      status
    end
  end
end
