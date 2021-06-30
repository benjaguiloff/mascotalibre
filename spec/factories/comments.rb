# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    id { 1 }
    contents { 'sabe' }
    association :publication
  end
end
