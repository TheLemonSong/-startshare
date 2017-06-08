class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy # This deletes the users projects when user is deleted.
  has_many :applications, through: :roles, dependent: :destroy # This deletes the users applications when user is deleted.
  has_many :roles, through: :projects

  validates :email, presence: true, uniqueness: :true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :zip, presence: :true
  validates :country, presence: :true
end


