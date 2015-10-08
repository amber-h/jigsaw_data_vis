class StatCalculator

	def self.female_ratio thoughtworkers
		female_count = 0
		thoughtworkers.each do |thoughtworker| 
			female_count += 1 if thoughtworker.is_female?
		end
		(female_count / thoughtworkers.size.to_f).round(4)
	end
end