# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.

class Student
   attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    return @first_name + ' ' + @last_name
  end

  def enroll(new_course)
    @courses.each do |c|
      if c.conflicts_with?(new_course)
        raise 'Time conflicts!'
      end
    end
    if !@courses.include?(new_course)
      @courses.push(new_course)
      new_course.students.push(self)
    end
  end

  def course_load
    course_credit = Hash.new(0)
    @courses.each do |each|
      course_credit[each.department] += each.credits.to_i
    end
    return course_credit
  end

end
