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
	end

	private

	def solution_params
		params.require(:solution).permit(:description, :status, :code)
	end
end