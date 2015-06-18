class GradesController < ApplicationController
  def create
    attributes = params.require(:grade).permit!

    gpa = attributes.delete(:gpa).to_f
    if gpa > 3
      letter = 'A'
    elsif gpa > 1
      letter = 'D'
    end

    grade = Grade.find_by_letter(letter)
    year = GradeYear.create!(
      student_id: params[:student_id],
      gpa: gpa,
      grade_id: grade.id,
      year: params[:year_id]
    )

    render status: :created,
           json: {
             id: year.id,
             letter: letter,
             gpa: gpa
           }
  end

  def index
    grade_years = GradeYear.where(student_id: params[:student_id])
    grades_by_year = grade_years.each_with_object({}) do |grade_year, hash|
      grade = Grade.find(grade_year.grade_id)
      hash[grade_year.year] = {
        id: grade_year.id,
        gpa: grade_year.gpa,
        letter: grade.letter,
      }
    end
    render json: grades_by_year
  end
end