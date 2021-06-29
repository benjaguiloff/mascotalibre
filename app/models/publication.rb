# frozen_string_literal: true

class Publication < ApplicationRecord
  has_one_attached :image
  has_many :solicitudes
  belongs_to :user
  has_many :comments
end
