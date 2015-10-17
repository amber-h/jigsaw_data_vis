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

	def is_female?
		self.gender == "Female"
	end

	def is_male?
		self.gender == "Male"
	end

	def is_grade? grade_level
		self.grade["name"] == grade_level
	end

end