require 'haml'
require 'sinatra'
require 'rest-client'
require 'dotenv'
require 'json'

JIGSAW_URL='https://jigsaw.thoughtworks.com/api'

def initialize
  Dotenv.load
  @jigsaw = get_jigsaw_resource 
end

get '/' do
   @jigsaw_people = get_people_by_role "dev", "40"
   puts @jigsaw_people
   haml :index, :format => :html5
end

def get_people_by_role role, pages
	@jigsaw_people = []
	for page in 1..pages.to_i
		@jigsaw_people << JSON[@jigsaw["people?role=#{role}&page=#{page}"].get]
	end
	@jigsaw_people.to_json
end

private

def get_jigsaw_resource
   RestClient::Resource.new(JIGSAW_URL, :headers => {:Authorization => ENV['JIGSAW_API_TOKEN']})
end


