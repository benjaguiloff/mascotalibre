FactoryBot.define do
    factory :publication do
      id {1}
      title {"sabe"}
      association :user 
    end
  end

