require 'rails_helper'

RSpec.describe 'blah', type: :request do
  def post(*)
    super

    JSON.parse(response.body, symbolize_names: true)
  end

  def get(*)
    super

    JSON.parse(response.body, symbolize_names: true)
  end

  it 'can create a student and their grade for a year' do
    body = post '/students', student: {blah: true}
    expect(body).to include(errors: {first_name: ["can't be blank"], last_name: ["can't be blank"]})

    student = post '/students', student: {first_name: 'Bob', last_name: 'Dobolina'}

    expect(student[:errors]).to be_blank
    expect(response).to have_http_status(:created)

    body = post "/students/#{student[:id]}/years/2014/grades", grade: {gpa: 3.5}
    expect(body).to match(
                      id: an_instance_of(Fixnum),
                      gpa: 3.5,
                      letter: 'A'
                    )
    expect(response).to have_http_status(:created)
    a_id = body[:id]

    body = post "/students/#{student[:id]}/years/2013/grades", grade: {gpa: 1.2}
    expect(response).to have_http_status(:created)
    d_id = body[:id]

    grades = get "/students/#{student[:id]}/grades"
    expect(grades).to match(
                        :'2014' => {
                          id: a_id,
                          gpa: 3.5,
                          letter: 'A'
                        },
                        :'2013' => {
                          id: d_id,
                          gpa: 1.2,
                          letter: 'D'
                        }
                      )
  end
end
