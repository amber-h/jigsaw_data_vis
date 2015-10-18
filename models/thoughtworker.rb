require_relative "../models/countries"
require_relative '../config/environments'
require 'sinatra/activerecord'

class ThoughtWorker < ActiveRecord::Base

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

	def is_home_office? home_office
		self.homeOffice["name"] == home_office
	end

	def is_country? country
		Countries.new.countries[country].include? self.homeOffice["name"]
	end

	def is_role? role
		self.role["name"] == role
	end

	def is_gender? gender
		self.gender == gender
	end

end