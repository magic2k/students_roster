class Student < ActiveRecord::Base

  has_many   :grades
  belongs_to :group

  def self.recalculate_average_grade(student_id)
 #   Student.transaction do
 #     s = Student.where(id: student_id).lock.first
 #     s.average_grade = Grade.where(student_id: student_id).average(:grade).truncate(2)
 #     s.save!
 #   end

     s = Student.where(id: student_id).first
     s.average_grade = Grade.where(student_id: student_id).average(:grade).truncate(2)
     s.save!
  end

end
