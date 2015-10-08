require 'rest-client'
require 'dotenv'
require 'json'
require_relative 'thoughtworker'

class Jigsaw

	JIGSAW_URL = 'https://jigsaw.thoughtworks.com/api'

	def initialize
		Dotenv.load
  		@jigsaw = get_jigsaw_resource 
	end

	def get_people_by_role role, pages
		thoughtworkers = Array.new
		for page in 1..pages.to_i
			jigsaw_json = @jigsaw["people?role=#{role}&page=#{page}"].get
			thoughtworker_array = parse_json_to_thoughtworker(jigsaw_json)
			(thoughtworkers << thoughtworker_array).flatten!
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
			thoughtworker = ThoughtWorker.new(d["employeeId"], d["gender"], d["role"], d["grade"], d["twExperience"], d["homeOffice"], d["workingOffice"])
			thoughtworkers << thoughtworker
		end

		thoughtworkers
	end


end