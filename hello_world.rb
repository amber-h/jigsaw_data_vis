require 'sinatra'
require 'rest_client'

get '/' do
   #data = RestClient.get 'https://jigsaw.thoughtworks.com/api/people', {:Authorization => 'auth token goes here'}
   haml :index, :format => :html5
end
