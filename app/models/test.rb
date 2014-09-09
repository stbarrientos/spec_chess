class Test < ActiveRecord::Base
	belongs_to :user
	has_many :solutions


	def collaborator_only
		self.personal ? true : false
	end
end