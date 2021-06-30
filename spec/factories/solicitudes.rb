# frozen_string_literal: true

FactoryBot.define do
  factory :solicitude do
    id { 1 }
    content { 'sabe' }
    association :publication
    association :user
  end
end
