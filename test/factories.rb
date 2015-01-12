FactoryGirl.define do  
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