require 'spec_helper.rb'

describe 'StatCalculator' do

	before(:each) do
      	@female_thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
      	@male_thoughtworker = ThoughtWorker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
	end
	
	describe '#female_ratio' do
		it 'should return 1 when there is 1 female and 0 male' do
			thoughtworkers = [@female_thoughtworker]
			actual_female_ratio = StatCalculator.female_ratio thoughtworkers

			expect(actual_female_ratio).to eq(1)
		end 

		it 'should return 0.5 when there is 1 female and 1 male' do
			thoughtworkers = [@female_thoughtworker, @male_thoughtworker]
			actual_female_ratio = StatCalculator.female_ratio thoughtworkers

			expect(actual_female_ratio).to eq(0.5)
		end 

		it 'should return 0 when there is 0 female and 1 male' do
			thoughtworkers = [@male_thoughtworker]
			actual_female_ratio = StatCalculator.female_ratio thoughtworkers

			expect(actual_female_ratio).to eq(0)
		end

		it 'should return 0.6667 when there are 2 female and 1 male' do
			thoughtworkers = [@female_thoughtworker, @female_thoughtworker, @male_thoughtworker]
			actual_female_ratio = StatCalculator.female_ratio thoughtworkers

			expect(actual_female_ratio).to eq(0.6667)
		end
	end
end