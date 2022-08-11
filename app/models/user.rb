class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :bookings
  has_many :users

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    [first_name, last_name].compact.join(" ")
  end
end
