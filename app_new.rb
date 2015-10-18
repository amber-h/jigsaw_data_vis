require 'haml'
require 'sinatra'
require 'rest-client'
require_relative 'models/stat_calculator'
require_relative 'etl/transform'
require 'sinatra/activerecord'
require './config/environments'
require 'pry'

class JigsawVisNew < Sinatra::Base

	get '/' do 
   		@thoughtworkers = Transform.new.transform_data
         puts @thoughtworkers

   		@female_dev_ratio = StatCalculator.ratio @thoughtworkers, "Dev", "Female"
         puts @female_dev_ratio
   		@female_ba_ratio = StatCalculator.ratio @thoughtworkers, "BA", "Female"
   		@female_qa_ratio = StatCalculator.ratio @thoughtworkers, "QA", "Female"
   		
   		haml :index, :format => :html5
	end

end