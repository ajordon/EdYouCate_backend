class User < ActiveRecord::Base
  include Authentication
  has_many :classrooms
  has_many :assignments
end
