class Job < ApplicationRecord
  validates  :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many   :comments, dependent: :destroy

  def self.sort_location
    order(:city)
  end

  def self.sort_interest
    order(:level_of_interest)
  end

  def self.find_by_city(location)
    where(city: location)
  end

  def self.group_by_interest
    group(:level_of_interest).count
  end
end
