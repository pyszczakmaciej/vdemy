class Lesson < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :chapter

  has_one_attached :file

  validate :acceptable_file

  private

  def acceptable_file
    return unless file.attached?

    acceptable_types = [ "video/mp4", "image/jpeg", "image/png", "image/jpg" ]
    unless acceptable_types.include?(file.content_type)
      errors.add(:file, "must be an image (jpg, jpeg, png) or mp4")
    end
  end
end
