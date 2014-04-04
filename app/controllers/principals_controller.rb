class PrincipalsController < ApplicationController
	def index
      @posts = Post.all
	end
end
