# SeminarsController
class SeminarsController < ApplicationController
  authorize_resource
  layout 'administration'

  def new
    @seminar = Seminar.new
    @from = params[:from]
    return unless @from == 'course'
    # if new action was triggered from inside a course view, add the course
    # info to the lecture
    @seminar.course = Course.find_by_id(params[:course])
    I18n.locale = @seminar.course.locale
  end

  def create
    @seminar = Seminar.new(seminar_params)
    @seminar.save
    if @seminar.valid?
      @seminar.update(sort: :special) if @seminar.course.term_independent
      @seminar.update(locale: I18n.default_locale.to_s)
      redirect_to administration_path,
                  notice: I18n.t('controllers.created_seminar_success',
                                 seminar: @seminar.term_title_info)
    end
    @errors = @seminar.errors
  end

  def edit
  end

  private

  def seminar_params
    params.require(:seminar).permit(:course_id, :teacher_id, :term_id, :sort,
                                    :title)
  end
end