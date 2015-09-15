require 'sinatra'
require 'rest_client'

get '/' do
   jigsaw_data = RestClient::Resource.new('https://jigsaw.thoughtworks.com/api', headers: {:Authorization => 'ENV[JIGSAW_API_TOKEN]'})
   puts jigsaw_data["people"].get

   haml :index, :format => :html5
end
