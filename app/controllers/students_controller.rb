class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :load_grades, only: [:edit, :update, :create, :new]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created
    else
      render json: @student.as_json(methods: :errors)
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def load_grades
    @grades = GradeLevel.all
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level_id)
  end
end
