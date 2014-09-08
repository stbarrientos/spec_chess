class CollaborationsController < ApplicationController

	def index
		@collaborators = current_user.collaborators
	end

	def show
		@collaborator = Collaborator.find(params[:id])
	end

	def create
		@collaboration = current_user.collaborations.build(collaborator_id: params[:collaborator_id])
		if @collaboration.save
			flash[:notice] = "Now collaborating with #{User.find(params[:collaborator_id])}"
			redirect_to test_path(params[:test_id])
		else
			flash[:notice] = "Unable to collaborate"
			redirect_to root_path
		end
	end

	def destroy
	end
end