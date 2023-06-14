class Route < ApplicationRecord
  include PgSearch::Model
  belongs_to :creator, class_name: "User"
  has_many :rides
  has_many :points, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :photos


  validates :name, presence: true, length: { minimum: 5 }
  validates :type_of_route, presence: true

  TYPE_OF_ROUTE = ['Urban', 'Suburban', 'CountrySide', 'Mountain']

  pg_search_scope :search_by_type_of_route, against: :type_of_route

  pg_search_scope :search_by_distance, against: :distance

  def total_distance
    distance = 0
    (points.length - 1).times do |i|
      distance += Point.distance_between(points[i], points[i + 1]) # Delta in meters
    end
    distance.to_i
  end
end
