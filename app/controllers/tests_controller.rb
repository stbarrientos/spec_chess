require 'open3'
class TestsController < ApplicationController

	before_action :authenticate_user!

	def index
		@tests = Test.all
		@stdin, @stdout, @stderr = Open3.popen3("rspec")
	end

	def show
		@test = Test.find(params[:id])
		@solutions = @test.solutions
	end

	def edit
		@test = Test.find(params[:id])
		@solution = @test.solutions
	end

	def update
		@test = Test.find(params[:id])
		@test.update_attributes(test_params)
		@solution = Solution.find(params[:format])
    @test.execute(@solution)    
		if @test.save
			@solution.save
			redirect_to test_solution_path(@test.id, params[:format])
		else
			redirect_to test_path(@test.id)
		end
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

  def compile
  #  render js: "alert(Opal.compile(params[:code]));"
  render js: "alert('it worked!')"
  end

	private

	def test_params
		params.require(:test).permit(:code, :description, :status, :name)
	end
end
