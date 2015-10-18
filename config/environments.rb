configure :development do
	db = URI.parse('postgres://jigsaw:jigsaw@localhost/jigsaw')

	ActiveRecord::Base.establish_connection(
			:adapter => 'postgresql',
			:host     => 'localhost',
			:username => 'jigsaw',
			:password => 'jigsaw',
			:database => 'jigsaw',
			:encoding => 'utf8'
	)
end
