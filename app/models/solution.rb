require 'shikashi'

include Shikashi

class Solution < ActiveRecord::Base
	belongs_to :test

	def editable
		return true unless self.test.collaborator_only
		current_user.id == self.user.id ? true : false
	end

	def execute
		s = Sandbox.new
		priv = Privileges.new
		priv.allow_method :method_missing
		priv.allow_method :attr_reader
		priv.allow_method :attr_accessor
		priv.allow_method :attr_writer
		s.run(priv, "#{self.code}")

		# Need to find a way to validate test code
		# s.run(priv, "#{self.test.code}")

		File.write('./app/controllers/sam/test.rb', "#{self.code}")
		File.write('./spec/test_spec.rb', "#{self.test.code}")

		stdin,stdout,stderr = Open3.popen3("rspec")
		self.output_text = stdout.read
		self.error_message = stderr.read
		self
	end
end