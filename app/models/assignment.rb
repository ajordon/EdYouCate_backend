class Assignment < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :user
  belongs_to :students
end
