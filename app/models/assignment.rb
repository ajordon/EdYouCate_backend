class Assignment < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :user
  has_many :students
end
