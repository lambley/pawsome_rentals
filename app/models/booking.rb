require 'active_support/core_ext/time/calculations'

class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :costume

  # validations
  # NOTE: date validations will be client side (on forms)
  validates :date_start, presence: true
  validates :date_end, presence: true
end
