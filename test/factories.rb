FactoryGirl.define do  

  factory :role do
    name "MyString"
  end

  factory :user do
    sequence :email do |n| 
      "person#{n}@example.com"
    end
    password "12345678"
    role {Role.find_by_name(Role::REGISTERED)}


    factory :admin do
      sequence :email do |n| 
        "admin#{n}@example.com"
      end
      role {Role.find_by_name(Role::ADMIN)}
    end
  end
  
  factory :article do
    title "Title"
    text "Body of article"
    user_id { create(:admin).id}
  end

  factory :comment do
    body "Their comment"
    article_id { create(:article).id }
    user_id { create(:user).id}
  end
end