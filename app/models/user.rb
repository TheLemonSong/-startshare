class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy # This deletes the users projects when user is deleted.
  has_many :applications, dependent: :destroy # This deletes the users applications when user is deleted.
  has_many :roles, through: :applications
  validates :email, presence: true, uniqueness: :true
  #           :first_name, presence: true,
  #           :last_name, presence: true,
  #           :location, presence: true,
end


