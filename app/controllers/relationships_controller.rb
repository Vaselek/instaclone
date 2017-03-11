class RelationshipsController < ApplicationController
	def create
		followed = User.find(params[:followed_id])
		current_user.follow followed

  	redirect_to :back
	end

	def destroy
		relationship = Relationship.find(params[:id])
		relationship.destroy

		redirect_to :back
	end


end
