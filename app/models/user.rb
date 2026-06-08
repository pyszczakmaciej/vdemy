class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :courses, foreign_key: :instructor_id, dependent: :nullify
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course
  has_many :payments, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, { student: 0, admin: 1 }, default: :student
end
