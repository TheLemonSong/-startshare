class User < ApplicationRecord
  include PgSearch
  attr_accessor :raw_address
  multisearchable against: [:skill_description, :first_name, :last_name, :city, :country]

  has_attachment :profile_photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy # This deletes the users projects when user is deleted.
  has_many :applications, through: :roles, dependent: :destroy # This deletes the users applications when user is deleted.
  has_many :roles, through: :projects
  has_many :applications

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :conversations, class_name: 'Conversation', foreign_key: 'recipient_id'


   validates :email, presence: true, uniqueness: :true
   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :city, presence: true
   validates :address, presence: true
   validates :zip, presence: :true
   validates :country, presence: :true


  # geocoded_by :full_address
  geocoded_by :city
  after_validation :geocode, if: :city_changed?


    # def full_address
    #   [country, city, address].compact.join(',')
    # end

end


