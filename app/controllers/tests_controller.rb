class TestsController < ApplicationController

	before_action :authenticate_user!

	def index
		@tests = Test.all
	end

	def show
		@test = Test.find(params[:id])
		@solutions = @test.solutions
	end

	def edit
		@test = Test.find(params[:id])
		@solution = @test.solutions.last
	end

	def update
		@test = Test.find(params[:id])
		@solution = @test.solution.last
	end

	def new
		@test = Test.new
	end

	def create
		@test = Test.new(test_params)
		@test.user_id = current_user.id
		if @test.save
			redirect_to test_path(@test.id)
		else
			redirect_to tests_path
		end
	end

	private

	def test_params
		params.require(:test).permit(:code, :description, :status, :name)
	end

end