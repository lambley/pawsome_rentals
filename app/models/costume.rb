class Costume < ApplicationRecord
  ANIMAL_TYPES = %w[dog cat]

  # associations
  belongs_to :user
  has_many :bookings

  # validations
  validates :name, presence: true
  validates :description, presence: true
  validates :animal_type, inclusion: { in: ANIMAL_TYPES }
end
