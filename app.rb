require 'haml'
require 'sinatra'
require 'rest-client'
require_relative 'models/jigsaw_manager'
require_relative 'models/stat_calculator'

get '/' do
   @thoughtworkers = Jigsaw.new.get_people_by_role "dev", "40"
   @female_ratio = StatCalculator.female_ratio @thoughtworkers
   haml :index, :format => :html5
end


