require 'spec_helper'
require 'dotenv'

describe 'Jigsaw' do

	describe '#get_people_by_role' do
		before(:each) do
      		Dotenv.load

          @jigsaw = Jigsaw.new
          @response_one_dev = json_file("one_person_role_dev.json")
          @response_two_dev = json_file("two_people_role_dev.json")
		end

		context 'returning ThoughtWorkers by role' do
			it 'should return 1 thoughtworker when search by role=dev' do
				stub_jigsaw_request @response_one_dev

				actualResponse = @jigsaw.get_people_by_role "Dev", "1"

        expectEqual actualResponse[0], ThoughtWorker.new("15733", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {}, {})
      end

      it 'should return 2 thoughtworkers when search by role=dev' do
        stub_jigsaw_request @response_two_dev

        actualResponse = @jigsaw.get_people_by_role "Dev", "1"

        expect(actualResponse.length).to eq(2)
        expectEqual actualResponse[0], ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
        expectEqual actualResponse[1], ThoughtWorker.new("17813", "Male", {"name" => "Dev"}, {"name"=> "Intern"}, 0.24, {"name"=> "Bangalore"}, {"name"=> "Bangalore"})
      end
		end
	end

  def expectEqual response, thoughtworker
        expect(response.employeeId).to eq(thoughtworker.employeeId)
        expect(response.gender).to eq(thoughtworker.gender)
        expect(response.role).to eq(thoughtworker.role)
        expect(response.grade).to eq(thoughtworker.grade)
  end

  def json_file filename
      File.read(File.join("spec", "jigsaw_response", filename))
  end

  def stub_jigsaw_request response_body
    stub_request(:get, "https://jigsaw.thoughtworks.com/api/people?page=1&role=Dev").
    with(:headers => {'Authorization'=> ENV['JIGSAW_API_TOKEN']}).
    to_return(:status => 200, :body => response_body, :headers => {})
  end
	
end