class Student < ActiveRecord::Base

  has_many   :grades
  belongs_to :group

#  def mean_grade
#    Student.where(id: self.id).average(:grade)
#    #mean(all_grades_array)
#  end
#
# def mean(array)
#   total = array.inject {|sum, x| sum += x}
#
# # use .to_f or BigDecimal
#   return total.to_f / array.length
# end
end
