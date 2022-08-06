class Costume < ApplicationRecord
  ANIMAL_TYPES = %w[dog cat]

  # associations
  belongs_to :user, optional: true
  has_many :bookings
  has_one_attached :photo

  # validations
  validates :name, presence: true
  validates :description, presence: true
  validates :animal_type, inclusion: { in: ANIMAL_TYPES }

  # for Geocoder
  geocoded_by :address
  # reverse_geocoded_by :longitude, :latitude

  after_validation :geocode
  # after_validation :reverse_geocode

  def address
    [street, city].compact.join(", ")
  end
end
