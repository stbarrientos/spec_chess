require 'shikashi'

include Shikashi

class Test < ActiveRecord::Base
	belongs_to :user
	has_many :solutions
	validates :user_id, presence: true


	def collaborator_only
		self.personal ? true : false
	end

	def remove_require
		lines = self.code.split("\n")
		lines.delete_if { |line| line.include?("require") }
		lines.join("\n")
	end

	def add_require
		self.code = "require 'spec_helper'\nrequire './app/controllers/sam/test.rb'\n#{self.code}"
	end

	def execute(solution)
		s = Sandbox.new
		priv = Privileges.new
		priv.allow_method(:method_missing).allow_method(:attr_reader).allow_method(:attr_accessor).allow_method(:require).allow_method(:describe)
		priv.object(Person).allow :new
		new_code = self.remove_require
		new_code = self.add_require

		# Need to validate test code
		# s.run(priv, "#{new_code}")
		
		s.run(priv, "#{solution.code}")

		File.write('./app/controllers/sam/test.rb', "#{solution.code}")
		File.write('./spec/test_spec.rb', "#{self.code}")

		new_code = self.remove_require

		stdin,stdout,stderr = Open3.popen3("rspec")
		solution.output_text = stdout.read
		solution.error_message = stderr.read
		self.code = new_code
		solution.save
		self
	end

end