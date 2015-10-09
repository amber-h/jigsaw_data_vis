require 'haml'
require 'sinatra'
require 'rest-client'
require_relative 'models/jigsaw_manager'
require_relative 'models/stat_calculator'

class JigsawVis < Sinatra::Base

	get '/' do
   		@dev_thoughtworkers = Jigsaw.new.get_people_by_role "dev"
   		@female_ratio = StatCalculator.female_ratio @dev_thoughtworkers
   		haml :index, :format => :html5
	end

end


