require 'haml'
require 'sinatra'
require 'rest-client'
require_relative 'models/thoughtworker'
require_relative 'models/jigsaw_manager'

get '/' do
   @thoughtworkers = Jigsaw.new.get_people_by_role "dev", "2"
   haml :index, :format => :html5
end


