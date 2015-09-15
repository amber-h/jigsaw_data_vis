require 'rubygems'
require 'bundler/setup'
require 'sinatra'

get '/' do
   haml :index, :format => :html5
end
