class GradeYears < ROM::Relation[:sql]
  def for_student_id(student_id)
    where(student_id: student_id)
  end
end