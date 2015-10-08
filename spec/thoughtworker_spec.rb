require 'spec_helper.rb'

describe 'ThoughtWorker' do

	describe "#is_female?" do
		it 'should return true when ThoughtWorker gender is female' do
			thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(true)
		end

		it 'should return false when ThoughtWorker gender is male' do
			thoughtworker = ThoughtWorker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(false)
		end
	end
end