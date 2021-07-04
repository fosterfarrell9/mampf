class Seminar < ApplicationRecord
  belongs_to :course
  has_many :talks, dependent: :destroy
  enum sort: { seminar: 0, oberseminar: 1, proseminar: 2 }

  validate :course_is_seminar

  # teacher is the user that gives the lecture
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

  private

  def course_is_seminar
    return true if course.seminar
    errors.add(:course, :no_seminar)
  end
end
