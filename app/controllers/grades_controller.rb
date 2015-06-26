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
    grade_years = rom.relation(:grade_years).for_student_id(params[:student_id]).as(:grade_year).to_a
    grades_by_year = grade_years.each_with_object({}) do |grade_year, hash|
      hash[grade_year.year] = grade_year.as_json
    end

    render json: grades_by_year
  end
end