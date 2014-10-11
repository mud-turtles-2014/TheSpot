FactoryGirl.define do
  factory :favorite do
    user_id {1}
    spot_id {1}

    factory :invalid_favorite do
      user_id nil
    end
  end
end