require 'spec_helper.rb'

describe 'ThoughtWorker' do

	describe "#is_female?" do
		it 'returns true when ThoughtWorker gender is female' do
			thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(true)
		end

		it 'returns false when ThoughtWorker gender is male' do
			thoughtworker = ThoughtWorker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(false)
		end
	end

	describe "#is_male?" do
		it 'returns true when ThoughtWorker gender is male' do
			thoughtworker = ThoughtWorker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_male?).to eq(true)
		end

		it 'returns false when ThoughtWorker gender is female' do
			thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_male?).to eq(false)
		end
	end

	describe "#is_grade?" do
		context "filter by grade Con" do
			it 'returns true when ThoughtWorker grade is Con' do
				thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Con").to eq(true)
			end

			it 'returns false when ThoughtWorker grade is not Con' do
				thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Con").to eq(false)
			end
		end

		context "filter by Sr Con" do
			it 'returns true when ThoughtWorker grade is Sr Con' do
				thoughtworker = ThoughtWorker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Sr Con").to eq(true)
			end
		end
	end
end