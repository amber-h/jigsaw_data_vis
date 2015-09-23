require 'spec_helper'
require_relative '../models/thoughtworker'
require_relative '../app'

describe 'App' do 

	describe '#get_people_by_role' do
		before(:all) do
   			RestClient = double

      		response = double
      		response.stub(:code) { 200 }
      		response.stub(:body) { "" }
      		response.stub(:headers) { {} }
      		RestClient.stub(:get) { response }  
		end

		context 'there are no devs and we search by role dev' do
			expected_result = Array.new
			jigsaw_people = get_people_by_role "dev", "1"
			expect(jigsaw_people.to eq(expected_result))
		end
	end
	
end