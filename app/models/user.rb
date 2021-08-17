# frozen_string_literal: true

class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enqueues
  has_many :patients, through: :enqueues

  validates_presence_of :email, :name, :phone, :notification_days
  validates_uniqueness_of :email, :phone, case_sensitive: false
  validates_uniqueness_of :invite_token

  has_secure_token :invite_token

  def invite_link
    regenerate_invite_token if invite_token.nil?
    new_patients_enqueue_url(invite_token: invite_token)
  end
end
