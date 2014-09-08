class Solution < ActiveRecord::Base
	belongs_to :test
	belongs_to :user

	def editable
		return true unless self.test.collaborator_only
		current_user.id == self.user.id ? true : false
	end
end