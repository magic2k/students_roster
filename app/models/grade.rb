class Grade < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :student
end
