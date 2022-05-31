class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  # validates :username, presence: true, uniqueness: true
  # validates :age, numericality: { greater_than: 17 }
end
