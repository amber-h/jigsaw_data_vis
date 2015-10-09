require 'haml'
require 'sinatra'
require 'rest-client'
require_relative 'models/jigsaw_manager'
require_relative 'models/stat_calculator'

class JigsawVis < Sinatra::Base

	get '/' do
   		@dev_thoughtworkers = Jigsaw.new.get_people_by_role "dev"
   		@ba_thoughtworkers = Jigsaw.new.get_people_by_role "BA"
   		@qa_thoughtworkers = Jigsaw.new.get_people_by_role "QA"

   		@female_dev_ratio = StatCalculator.female_ratio @dev_thoughtworkers
   		@female_ba_ratio = StatCalculator.female_ratio @ba_thoughtworkers
   		@female_qa_ratio = StatCalculator.female_ratio @qa_thoughtworkers

   		haml :index, :format => :html5
	end

end


