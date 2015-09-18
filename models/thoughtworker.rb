class ThoughtWorker
	attr_accessor :employeeId, :gender, :role, :grade, :twExperience, :homeOffice, :workingOffice
	
	def initialize(employeeId, gender, role, grade, twExperience, homeOffice, workingOffice)
		@employeeId = employeeId
		@gender = gender
		@role = role
		@grade = grade
		@twExperience = twExperience
		@homeOffice = homeOffice
		@workingOffice = workingOffice
	end

end