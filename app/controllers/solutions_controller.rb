require 'open3'

class SolutionsController < ApplicationController

	def show
		@test = Test.find(params[:test_id])
		@solution = Solution.find(params[:id])
	end

	def new
		@test = Test.find(params[:test_id])
		@solution = Solution.new
	end

	def create
		@solution = Solution.new(solution_params)
		@solution.user_id = current_user.id
		@solution.test_id = params[:test_id]
		if @solution.save
			redirect_to test_solution_path(params[:test_id], @solution.id)
		else
			redirect_to new_test_solution_path(@solution.id)
		end
	end

	def update
		@test = Test.find(params[:test_id])
		@solution = Solution.find(params[:id])
		@solution.update_attributes(solution_params)
		File.write('./app/controllers/sam/test.rb', "#{@solution.code}")
		File.write('./spec/test_spec.rb', "#{@test.code}")
		@stdin, @stdout, @stderr = Open3.popen3("rspec")
		if @stderr.readlines.empty?
			@solution.output = @stdout.readlines.to_s
		else
			@solution.output = @stderr.readlines.to_s
		end
		if @solution.save
			redirect_to test_solution_path(@test.id, @solution.id)
		else
			redirect_to test_solutions_path(@test.id)
		end
	end

	private

	def solution_params
		params.require(:solution).permit(:description, :status, :code, :name)
	end
end