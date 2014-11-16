FactoryGirl.define do

  factory :message do
    id 1
    text "Cool message text"
    blacklist false

    trait :blacklisted do
      blacklist true
    end
  end

end
