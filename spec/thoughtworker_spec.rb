require 'spec_helper.rb'

describe 'ThoughtWorker' do

	describe "#is_female?" do
		it 'returns true when ThoughtWorker gender is female' do
			thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(true)
		end

		it 'returns false when ThoughtWorker gender is male' do
			thoughtworker = Thoughtworker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_female?).to eq(false)
		end
	end

	describe "#is_male?" do
		it 'returns true when ThoughtWorker gender is male' do
			thoughtworker = Thoughtworker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_male?).to eq(true)
		end

		it 'returns false when ThoughtWorker gender is female' do
			thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
			expect(thoughtworker.is_male?).to eq(false)
		end
	end

	describe "#is_grade?" do
		context "Con" do
			it 'returns true when ThoughtWorker grade is Con' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Con").to eq(true)
			end

			it 'returns false when ThoughtWorker grade is not Con' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Con").to eq(false)
			end
		end

		context "Sr Con" do
			it 'returns true when ThoughtWorker grade is Sr Con' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Melbourne"}, {"name"=> "Melbourne"})
				expect(thoughtworker.is_grade? "Sr Con").to eq(true)
			end
		end
	end

	describe "#is_home_office?" do
		context "Chicago" do
			it 'returns true when ThoughtWorker homeOffice is Chicago' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Chicago"}, {"name"=> "Chicago"})
				expect(thoughtworker.is_home_office? "Chicago").to eq(true)
			end

			it 'returns false when ThoughtWorker homeOffice is not Chicago' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Dallas"}, {"name"=> "Dallas"})
				expect(thoughtworker.is_home_office? "Chicago").to eq(false)
			end
		end
	end

	describe "#is_country?" do
		context "Canada" do
			it 'returns true when ThoughtWorker homeOffice is Toronto' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Toronto"}, {"name"=> "Toronto"})
				expect(thoughtworker.is_country? "canada").to eq(true)
			end

			it 'returns false when ThoughtWorker homeOffice is not Toronto' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Dallas"}, {"name"=> "Dallas"})
				expect(thoughtworker.is_country? "canada").to eq(false)
			end
		end

		context "USA" do
			it 'returns true when ThoughtWorker homeOffice is Chicago' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Chicago"}, {"name"=> "Chicago"})
				expect(thoughtworker.is_country? "usa").to eq(true)
			end
		end
	end

	describe "#is_gender?" do
		context "Male" do
			it 'returns true when ThoughtWorker gender is male' do
				thoughtworker = Thoughtworker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Toronto"}, {"name"=> "Toronto"})
				expect(thoughtworker.is_country? "canada").to eq(true)
			end

			it 'returns false when ThoughtWorker gender is female' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Dallas"}, {"name"=> "Dallas"})
				expect(thoughtworker.is_country? "canada").to eq(false)
			end
		end

		context "Female" do
			it 'returns true when ThoughtWorker gender is female' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Chicago"}, {"name"=> "Chicago"})
				expect(thoughtworker.is_country? "usa").to eq(true)
			end
		end
	end

	describe "#is_role?" do
		context "Dev" do
			it 'returns true when ThoughtWorker role is Dev' do
				thoughtworker = Thoughtworker.new("33333", "Male", {"name" => "Dev"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Toronto"}, {"name"=> "Toronto"})
				expect(thoughtworker.is_country? "canada").to eq(true)
			end

			it 'returns false when ThoughtWorker role is not Dev' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "BA"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Dallas"}, {"name"=> "Dallas"})
				expect(thoughtworker.is_country? "canada").to eq(false)
			end
		end

		context "BA" do
			it 'returns true when ThoughtWorker role is BA' do
				thoughtworker = Thoughtworker.new("33333", "Female", {"name" => "BA"}, {"name"=> "Sr Con"}, 1.96, {"name"=> "Chicago"}, {"name"=> "Chicago"})
				expect(thoughtworker.is_country? "usa").to eq(true)
			end
		end
	end
end