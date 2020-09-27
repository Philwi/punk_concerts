class Show < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :flyer

  scope :upcoming, -> { where('planned_for >= ?', Date.today).order(:planned_for, :id) }
  scope :upcoming_with_flyer, -> { joins(:flyer_attachment).where('planned_for >= ?', Date.today).order(:planned_for, :id) }
end
