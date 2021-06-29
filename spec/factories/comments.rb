FactoryBot.define do
  factory :comment do
    id {1}
    contents {"sabe"} 
    user_id {1}
    publication_id {1}
  end
end
  