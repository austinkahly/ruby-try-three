FactoryGirl.define do  

  factory :role do
    name "MyString"
  end

  factory :user do
    
  end
  
  factory :article do
    title "Title"
    text "Body of article"
  end

  factory :comment do
    commenter "Commenter's Name"
    body "Their comment"
    article_id { create(:article).id }

  end
end