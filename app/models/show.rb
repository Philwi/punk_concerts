class Show < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  geocoded_by :city

  has_one_attached :flyer

  scope :upcoming, -> { where('planned_for >= ?', Date.today).order(:planned_for, :id) }
  scope :upcoming_with_flyer, -> { joins(:flyer_attachment).where('planned_for >= ?', Date.today).order(:planned_for, :id) }

  def address
    "#{postalcode} #{city}"
  end
end
