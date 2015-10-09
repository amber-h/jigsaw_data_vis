class StatCalculator

	def self.female_ratio thoughtworkers
		female_count = thoughtworkers.select {|t| t.is_female?}.size
		(female_count / thoughtworkers.size.to_f).round(4)
	end
end