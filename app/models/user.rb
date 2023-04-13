# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :project_details, dependent: :destroy
  has_many :projects, through: :project_details, dependent: :destroy
  has_many :bugs, dependent: :destroy
  enum role: { Manager: 0, Developer: 1, QA: 2 }
  validates :email, :password, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :role, inclusion: { in: User.roles.keys }
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
