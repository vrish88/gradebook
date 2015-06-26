class GradeYearMapper < ROM::Mapper
  relation :grade_years
  register_as :grade_year
  model GradeYear
end