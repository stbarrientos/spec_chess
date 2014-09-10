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
		new_code = code.split(" ")
		for i in (0..new_code.count-1)
			if new_code[i] == "require"
				new_code[i] = ""
				new_code[i+1] = ""
			end
		end
		new_code.to_s
	end

	def add_require
		self.code = "require 'spec_helper'\nrequire './app/controllers/sam/test.rb'\n#{self.code}"
	end

	def execute(solution)
		s = Sandbox.new
		priv = Privileges.new
		priv.allow_method(:method_missing).allow_method(:attr_reader).allow_method(:attr_accessor).allow_method(:require)
		self.add_require
		# s.run(priv, "#{self.code}")
		s.run(priv, "#{solution.code}")

		File.write('./app/controllers/sam/test.rb', "#{solution.code}")
		File.write('./spec/test_spec.rb', "#{self.code}")

		self.remove_require

		stdin,stdout,stderr = Open3.popen3("rspec")
		solution.output_text = stdout.read
		solution.error_message = stderr.read
		solution.save
		self
	end

end