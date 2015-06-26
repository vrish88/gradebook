class GradeYear < ActiveRecord::Base
  belongs_to :grade
  def as_json(*)
    {
      id: id,
      letter: grade.letter,
      gpa: gpa
    }
  end
end