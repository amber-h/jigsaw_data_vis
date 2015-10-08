class StatCalculator

	def self.female_ratio thoughtworkers
		female_count = 0
		thoughtworkers.each do |thoughtworker| 
			if thoughtworker.gender == "Female"
				female_count += 1
			end
		end
		(female_count / thoughtworkers.size.to_f).round(4)
	end
end