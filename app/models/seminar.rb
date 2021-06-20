class Seminar < ApplicationRecord
  belongs_to :course
  has_many :talks
  enum sort: { seminar: 0, oberseminar: 1, proseminar: 2 }

  validate :course_is_seminar

  private

  def course_is_seminar
    return true if course.seminar
    errors.add(:course, :no_seminar)
  end
end
