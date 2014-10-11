FactoryGirl.define do
  factory :user do
    username {"sarah"}
    password {"password"}
    password_confirmation {"password"}
    email {"sarah@gmail.com"}
  end

  factory :spot do
    name {"Sarah's Bakery"}
    address {"100 Fifth Avenue New York, NY 10003"}
    phone {"212-555-555"}
    price {2}
  end

  factory :favorite do
    user_id {create(:user).id}
    spot_id {create(:spot).id}

    factory :invalid_favorite do
      user_id nil
    end
  end

  factory :comment do
    user_id { create(:user).id }
    spot_id { create(:spot).id }
    body { "best cookies in the city" }

    factory :invalid_comment do
      user_id nil
    end

  end
end
