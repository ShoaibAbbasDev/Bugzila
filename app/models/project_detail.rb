# frozen_string_literal: true

class ProjectDetail < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user_id, :project_id, :project_creator, presence: true
  validates_uniqueness_of :user_id, scope: :project_id
end
