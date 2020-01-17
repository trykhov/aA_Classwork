# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  # Course.first gives us the first element of Course.all
  # Course.first.enrollments gives us a query of Course.first
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    primary_key: :id,
    through: :enrollments, # calls Course#enrollments, 
    source: :user # then is able to access Enrollment#user

  # whenever it self references, it is ALWAYS a belongs_to
  # prereq_id is referencing course because prereq is another COURSE
  # **** any time there's a belongs_to that involves a column, it adds validation constraint to column
  belongs_to :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course,
    # optional: true (allows prereq_id to be null)

  # Course.first.prerequisite
  # SELECT
  #   course.*
  # FROM
  #   course
  # WHERE
  #   course.id = Course.first.prereq_id

  belongs_to :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User 

end
