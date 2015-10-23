require 'rest-client'
require 'dotenv'
require 'json'
require_relative 'thoughtworker'
require 'pry'

class Jigsaw

	JIGSAW_URL = 'https://jigsaw.thoughtworks.com/api'

	def initialize
		Dotenv.load
  		@jigsaw = get_jigsaw_resource 
	end

	# def get_people_by_role role
	# 	thoughtworkers = parse_json_to_thoughtworker(File.read(File.dirname(__FILE__), "jigsaw.json"))
	# 	thoughtworkers.select { |t| t.role == "{ name : #{role} }"}
	# end


	def get_people_by_role role
		thoughtworkers = Array.new
		page = 1
		loop do
			jigsaw_json = @jigsaw["people?role=#{role}&page=#{page}"].get
			break if JSON.parse(jigsaw_json).empty?

			thoughtworker_array = parse_json_to_thoughtworker(jigsaw_json)
			thoughtworkers = thoughtworkers + thoughtworker_array
			page += 1 
		end

		thoughtworkers
	end

	private 

	def get_jigsaw_resource
   		RestClient::Resource.new(JIGSAW_URL, :headers => {:Authorization => ENV['JIGSAW_API_TOKEN']})
	end

	def parse_json_to_thoughtworker data
		thoughtworkers = Array.new
		JSON.parse(data).each do |d|
			thoughtworkers << Thoughtworker.new(d["employeeId"], d["gender"], d["role"], d["grade"], d["twExperience"], d["homeOffice"], d["workingOffice"])
		end

		thoughtworkers
	end
end