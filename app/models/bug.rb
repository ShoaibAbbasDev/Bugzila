# frozen_string_literal: true

class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :bug_image
  validates :title, :status, :bug_type, :project_id, :deadline, :bug_image, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 15..30 }
  validate  :check_date, :image_type
  # validate :image_type

  private

  def check_date
    errors.add(:deadline, 'enter today or later date') if !deadline.nil? && (deadline < Date.today)
    errors.add(:bug_image, 'is missing!') if bug_image.attached? == false
  end

  def image_type
    if bug_image.attached? && !bug_image.content_type.in?(%('bug_image/jpg bug_image/png'))
      errors.add(:bug_image, 'needs to be a jpg or png!')
    end
  end
end
