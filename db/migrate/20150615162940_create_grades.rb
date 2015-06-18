class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :letter
      t.decimal :number_value
      t.references :student

      t.timestamps null: false
    end
  end
end
