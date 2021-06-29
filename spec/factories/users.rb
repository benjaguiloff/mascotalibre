FactoryBot.define do
  factory :user do |u|
    u.sequence(:id) { |n| "#{n}"}
    u.sequence(:email) {|n| "sabe#{n}@sabe.cl"}
    u.password {"123123"}
    u.name {"sabe"}
    u.phone {"123123"}
    
  end

end
