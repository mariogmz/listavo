class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enqueues
  has_many :patients, through: :enqueues

  validates_presence_of :email, :name, :phone, :notification_days
end
