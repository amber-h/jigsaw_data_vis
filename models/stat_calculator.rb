class StatCalculator

	def self.female_ratio thoughtworkers
		female_count = thoughtworkers.select {|t| t.is_female?}.size
		(female_count / thoughtworkers.size.to_f).round(4)
	end

	def self.ratio thoughtworkers, role, gender
		filtered_thoughtworkers = thoughtworkers.select { |t| t.is_role? role }.select { |t| t.is_gender? gender }
		(filtered_thoughtworkers.size / thoughtworkers.size.to_f).round(4)
	end
end

