# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@groups=15
@students=100



# Groups seed
(@groups/3).times do |i|
  i+=1
  Group.create!(name: "10#{i}")
  Group.create!(name: "20#{i}")
  Group.create!(name: "30#{i}")
end

#create 8 disciplines
  Discipline.create!(name: 'Arts')
  Discipline.create!(name: 'Mathematics')
  Discipline.create!(name: 'Physics')
  Discipline.create!(name: 'Geography')
  Discipline.create!(name: 'Biology')
  Discipline.create!(name: 'Chemistry')
  Discipline.create!(name: 'Computer science')
  Discipline.create!(name: 'Statistics')

# create some random students
(@students/2).times do |i|
  i+=1
  @ip = Faker::Internet.ip_v4_address

  Student.create!(first_name: Faker::Name.first_name,
                  last_name:  Faker::Name.last_name,
                  birth_date: Faker::Date.between(40.years.ago, 16.years.ago),
                  email:      Faker::Internet.email,
                  ip_address: @ip,
                  semester:   rand(1...5),
                  created_at: Faker::Time.backward(90),
                  group_id:   rand(1...16) )

  #some of them will have characteristics and non-unique ip's
  if (i % 2 == 0)
    stud = Student.create!(first_name: Faker::Name.first_name,
                    last_name:  Faker::Name.last_name,
                    birth_date: Faker::Date.between(40.years.ago, 16.years.ago),
                    email:      Faker::Internet.email,
                    ip_address: @ip,
                    semester:   rand(1...5),
                    created_at: Faker::Time.backward(90),
                    group_id:   rand(1...16) )
    LeadCharacteristicOfStudent.create!(student_id: stud.id, characteristic: Faker::Hacker.say_something_smart)
  end


#create grades in disciplines for students
  @studs = Student.all
  @studs.each do |s|
    6.times do
      disc_id = rand(1...9)
      Grade.where(student_id: s.id).where(discipline_id: disc_id).first_or_create!(student_id: s.id, discipline_id: disc_id, grade: rand(1...6))
    end
  end
end




