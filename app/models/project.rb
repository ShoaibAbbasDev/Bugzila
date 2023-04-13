# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_details, dependent: :destroy
  has_many :bugs,  dependent: :destroy
  has_many :users, through: :project_details, dependent: :destroy
  validates :name, :description, :status, :due_date, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 10..40 }
end
