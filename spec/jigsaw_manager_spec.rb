require 'spec_helper'
require 'dotenv'

describe 'Jigsaw' do

  JIGSAW_URL = "https://jigsaw.thoughtworks.com/api/people?page=1&role=Dev"

	describe '#get_people_by_role' do
		before(:each) do
      		Dotenv.load

          @jigsaw = Jigsaw.new
          @response_one_dev = json_file("one_person_role_dev.json")
          @response_two_dev = json_file("two_people_role_dev.json")

          stub_jigsaw_request "[]", 2
		end

		context '1 thoughtworker' do
			it 'should return 1 thoughtworker when search by role=dev' do
				stub_jigsaw_request @response_one_dev, 1

				actualResponse = @jigsaw.get_people_by_role "Dev"

        expect(actualResponse[0]) == Thoughtworker.new("15733", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
      end

      
		end

    context "there are two" do 
      it 'should return 2 thoughtworkers when search by role=dev' do
        stub_jigsaw_request @response_two_dev, 1

        actualResponse = @jigsaw.get_people_by_role "Dev"

        expect(actualResponse.length).to eq(2)
        expect(actualResponse[0]) == Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
        expect(actualResponse[1]) == Thoughtworker.new("17813", "Male", {"name" => "Dev"}, {"name"=> "Intern"}, 0.24, {"name"=> "Bangalore"}, {"name"=> "Bangalore"})
      end
    end
	end

  def json_file filename
      File.read(File.join("spec", "jigsaw_response", filename))
  end

  def stub_jigsaw_request response_body, page
    stub_request(:get, "https://jigsaw.thoughtworks.com/api/people?page=#{page}&role=Dev").
    with(:headers => {'Authorization'=> ENV['JIGSAW_API_TOKEN']}).
    to_return(:status => 200, :body => response_body, :headers => {})
  end
	
end