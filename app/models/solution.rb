class Solution < ActiveRecord::Base
	belongs_to :test

	def editable
    # Check to see if the current user is allowed to edit any code on the screen
		return true unless self.test.collaborator_only
		current_user.id == self.user.id ? true : false
	end

  def execute(solution)

    # Write the test and solution from the user into the spec test and target file
    File.write('./app/controllers/sam/test.rb', "#{self.code}")
    File.write('./spec/test_spec.rb', "#{self.test.code}")

    # Execute rspec on those files
    stdin,stdout,stderr = Open3.popen3("rspec")
    
    # Save the results and any errors
    self.output_text = stdout.read
    self.error_message = stderr.read
    self
  end
end
