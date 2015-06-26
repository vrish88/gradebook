class CreateGradeYear < ROM::Commands::Create[:sql]
  relation :grade_years
  register_as :create
  result :one

  def execute(attributes)
    gpa = attributes.delete(:gpa).to_f
    if gpa > 3
      letter = 'A'
    elsif gpa > 1
      letter = 'D'
    end

    grade = Grade.find_by_letter(letter)
    grade_year = GradeYear.create!(
      student_id: attributes[:student_id],
      gpa: gpa,
      grade_id: grade.id,
      year: attributes[:year]
    )

    [grade_year.attributes]
  end
end

