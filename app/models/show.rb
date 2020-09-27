class Show < ApplicationRecord
  has_one_attached :flyer

  scope :upcoming, -> { where('planned_for >= ?', Date.today).order(:planned_for, :id) }
end
