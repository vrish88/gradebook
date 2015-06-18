class CreateGradeYears < ActiveRecord::Migration
  def change
    remove_reference :grades, :student

    create_table :grade_years do |t|
      t.integer :year, null: false
      t.float :gpa, null: false
      t.references :student, index: true, foreign_key: true, null: false
      t.references :grade, index: true, foreign_key: true, null: false
    end
  end
end
