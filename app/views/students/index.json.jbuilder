json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :birth_date, :email, :ip_address, :mean_grade
  json.url student_url(student, format: :json)
end
