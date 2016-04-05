class Classroom < ActiveRecord::Base
  has_many :students, dependent: :destroy
  has_many :assignments, dependent: :destroy
  belongs_to :user

  #validates :student_id, uniquenes: true
end
