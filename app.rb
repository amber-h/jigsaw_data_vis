require 'haml'
require 'sinatra'
require 'rest-client'
require 'dotenv'
require 'json'
require_relative 'models/thoughtworker'

JIGSAW_URL='https://jigsaw.thoughtworks.com/api'

def initialize
  Dotenv.load
  @jigsaw = get_jigsaw_resource 
end

get '/' do
   @jigsaw_people = get_people_by_role "dev", "40"
   haml :index, :format => :html5
end

private

def get_jigsaw_resource
   RestClient::Resource.new(JIGSAW_URL, :headers => {:Authorization => ENV['JIGSAW_API_TOKEN']})
end

def get_people_by_role role, pages
	jigsaw_people = []
	for page in 1..pages.to_i
		jigsaw_people << parse_json_to_thoughtworker(JSON.parse(@jigsaw["people?role=#{role}&page=#{page}"].get))
	end

	jigsaw_people
end

def parse_json_to_thoughtworker json_data
	json_data.map { |d| ThoughtWorker.new(d['employeeId'], d['gender'], d['role'], d['grade'], d['twExperience'], d['homeOffice'], d['workingOffice'])}
end


