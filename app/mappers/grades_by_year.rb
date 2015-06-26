class GradesByYear < ROM::Mapper
  register_as :grades_by_year
  relation :grade_years

  model GradeYear

  def call(grade_years)
    grade_years = grade_years.map{|gy| header.model.new(gy)}

    grade_years.each_with_object({}) do |grade_year, hash|
      hash[grade_year.year] = grade_year.as_json
    end
  end
end