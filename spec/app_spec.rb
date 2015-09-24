require 'spec_helper'
require_relative '../models/thoughtworker'
require_relative '../app'

describe 'App' do 

	JIGSAW_URL = "https://jigsaw.thoughtworks.com/api/people"

	describe '#get_people_by_role' do
		before(:all) do
      		 Dotenv.load
           @jigsaw_response_body = File.read(File.join("spec", "jigsaw_response", "one_person_role_dev.json"))
		end

		context 'returning ThoughtWorkers by role' do
			it 'should return 1 dev when search by role=dev' do
				stub_jigsaw_request @jigsaw_response_body

				actualResponse = get_people_by_role "Dev", "1"

			  expect(actualResponse[0].employeeId).to eq("15722") 
        expect(actualResponse[0].gender).to eq("Male") 
        expect(actualResponse[0].role).to eq({"name" => "Dev"}) 
      end

      def stub_jigsaw_request response_body
        stub_request(:get, "https://jigsaw.thoughtworks.com/api/people/people?page=1&role=Dev").
        with(:headers => {'Authorization'=> ENV['JIGSAW_API_TOKEN']}).
        to_return(:status => 200, :body => response_body, :headers => {})
      end
		end
	end
	
end