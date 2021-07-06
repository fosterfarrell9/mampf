class Seminar < ApplicationRecord
  belongs_to :course
  belongs_to :term, optional: true
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

  has_many :talks, dependent: :destroy
  enum sort: { seminar: 0, proseminar: 1, oberseminar: 2, special: 3 }

  validates :title, presence: true,
                    uniqueness: { scope: [:course_id, :teacher_id, :term_id,
                                          :sort] }
  validate :course_is_seminar

  validate :absence_of_term, if: :term_independent?

  validate :only_one_seminar, if: :term_independent?, on: :create


  # teacher is the user that gives the lecture
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'



  def self.sorts
    ['seminar', 'proseminar', 'oberseminar']
  end

  def self.sort_localized
    Seminar.sorts.map { |s| [s, I18n.t("admin.lecture.#{s}")] }.to_h
  end

  def term_title_teacher_info
    term_title_info + ", #{teacher.name}"
  end

  def term_title_info
    "#{term&.to_label_short} (#{sort_localized_short}) #{title}"
  end

  def term_to_label_short
    return term.to_label_short if term
    ''
  end

  def sort_localized_short
    I18n.t("admin.lecture.#{sort}_short")
  end

  def sort_localized_short_with_course
    "#{sort_localized_short} (#{course.short_title})"
  end

  private

  def course_is_seminar
    return true if course.seminar
    errors.add(:course, :no_seminar)
  end

  def term_independent?
    return false unless course
    course.term_independent
  end

  def absence_of_term
    return unless term
    errors.add(:term, :present)
  end

  def only_one_seminar
    return unless Seminar.where(course: course).any?
    errors.add(:course, :already_present)
  end
end
