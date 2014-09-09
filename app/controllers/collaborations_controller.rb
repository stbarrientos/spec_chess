class CollaborationsController < ApplicationController

	def index
		@collaborators = current_user.collaborators
	end

	def create
		@collaboration = current_user.collaborations.build(collaborator_id: params[:collaborator_id])
		if @collaboration.save
			flash[:notice] = "Now collaborating with #{User.find(params[:collaborator_id])}"
		else
			flash[:notice] = "Unable to collaborate"
		end
	end

	def destroy
		@collaboration = Collaboration.find(params[:id])
		@collaboration.destroy
		redirect_to my_collaborations_path
	end
end