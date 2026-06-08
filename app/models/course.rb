class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :instructor, class_name: "User"
  has_many :chapters, -> {order(:position)}, dependent: :destroy
  has_many :lessons, through: :chapters
  has_many :enrollments, dependent: :destroy
  has_many :payments


  enum :category, {
    programming: 0,
    design: 1,
    data_ai: 2,
    business: 3,
    languages: 4,
    mathematics: 5,
  }, default: :programming

  enum :level, {
    beginner: 0,
    intermediate: 1,
    advanced: 2,
  }, default: :beginner

  def display_price
    free ? "Free" : "$#{price.to_i}"
  end

  scope :published, -> { where(published: true) }

  CATEGORY_LABELS = {
    "programming" => "Programming",
    "design" => "Design",
    "data_ai" => "Data Ai",
    "business" => "Business",
    "languages" => "Languages",
    "mathematics" => "Mathematics",
  }.freeze

  LEVEL_LABELS = {
    "beginner" => "Beginner",
    "intermediate" => "Intermediate",
    "advanced" => "Advanced",
  }.freeze
end
