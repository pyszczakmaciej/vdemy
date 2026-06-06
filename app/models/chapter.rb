class Chapter < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :course
  has_many :lessons, dependent: :destroy
end
