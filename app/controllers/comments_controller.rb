class CommentsController < ApplicationController
	skip_before_filter :verify_authenticity_token 
	def create
       @post = Post.find(params[:id])
	   @comment = @post.comments.create(params[:body])
	   redirect_to '/'
	end
end
