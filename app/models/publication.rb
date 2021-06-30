# frozen_string_literal: true

class Publication < ApplicationRecord
  has_one_attached :image
  has_many :solicitudes, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
end
