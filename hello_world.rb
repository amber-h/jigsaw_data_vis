require 'sinatra'
require 'rest_client'

get '/' do
   @jigsaw_data = RestClient::Resource.new('https://jigsaw.thoughtworks.com/api', headers: {:Authorization => 'ENV[JIGSAW_API_TOKEN]'})
   @jigsaw_people = @jigsaw_data["people"].get
   puts @jigsaw_people
   haml :index, :format => :html5
end
