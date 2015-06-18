class Student < ActiveRecord::Base
  belongs_to :grade_level

  has_many :grades

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
