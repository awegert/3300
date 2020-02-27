class Movie < ActiveRecord::Base

	@@aratings = ['G','PG','PG-13','R']

	def self.aratings
		@@aratings
	end

end