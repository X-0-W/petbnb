class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :bookings
  # has_many :pets, through: :bookings, as: :pets_to_borrow
  # validates :username, presence: true, uniqueness: true
  # validates :age, numericality: { greater_than: 17 }
end
