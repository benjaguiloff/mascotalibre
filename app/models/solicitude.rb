# frozen_string_literal: true

class Solicitude < ApplicationRecord
  belongs_to :user
  belongs_to :publication
end
