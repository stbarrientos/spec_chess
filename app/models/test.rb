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
    
    # Delete any require statments in the code, then add our own
    new_code = self.remove_require
    new_code = self.add_require

    # Write into the spec and the target file
    File.write('./app/controllers/sam/test.rb', "#{solution.code}")
    File.write('./spec/test_spec.rb', "#{new_code}")
    
    # Execute rspec on the tests and tore the results
    stdin,stdout,stderr = Open3.popen3("rspec")
    solution.output_text = stdout.read
    solution.error_message = stderr.read

    # Save the code without any require statements
    new_code = self.remove_require
    self.code = new_code
    solution.save
    self
  end

end
