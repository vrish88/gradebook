class GradesController < ApplicationController
  def create
    attributes = params.require(:grade)
                   .permit!
                   .merge(year: params[:year_id], student_id: params[:student_id])

    create_command = rom.command(:grade_years).as(:grade_year).create
    grade_year = create_command.call(attributes)

    render json: grade_year, status: :created
  end

  def index
    grades_by_year = rom
                       .relation(:grade_years)
                       .for_student_id(params[:student_id])
                       .as(:grades_by_year)
                       .call
                       .collection

    render json: grades_by_year
  end
end