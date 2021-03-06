class PostsController < ApplicationController
	def index
		#@posts = Post.all

     @posts = Post.search(params[:searchbox])

       respond_to do |format|

           format.html 

       end
	end

	def new 
        @post = Post.new
	end

	def edit
       @post = Post.find(params[:id])
	end

	def create
       @post = Post.new
       @post.title = params[:post][:title]
       @post.text = params[:post][:text]
       @post.category = params[:post][:category]
       @post.like = 0

       if @post.save
       	  redirect_to '/', notice: 'El post ha sido creado exitosamente'
       	else
       		render 'new'
       	end

	end

	def delete
      @post = Post.find(params[:id])
      if @post.destroy
      	redirect_to '/', notice: 'El post ha sido borrado exitosamente'
      else
      	redirect_to '/', notice: 'No se pudo borrar el post'
      end
	end

	def update
       @post = Post.find(params[:id])
       @post.title = params[:post][:title]
       @post.text = params[:post][:text]
        @post.category = params[:post][:category]

       if @post.save
       	  redirect_to '/', notice: 'El post ha sido actualizado exitosamente'
       	else
       		render 'edit'
       	end
	end

	def like
     @post = Post.find(params[:id])
     @post.like = @post.like + 1
     @post.save
     redirect_to '/posts' 
	end

	def like_principal
     @post = Post.find(params[:id])
     @post.like = @post.like + 1
     @post.save
     redirect_to '/' 
	end

  def dislike
    @post = Post.find(params[:id])
    if (@post.like==0)
      @post.like = 0
      @post.save
      redirect_to '/'
    else
       @post.like = @post.like - 1
      @post.save
      redirect_to '/'
    end
  end

	def show_comment
	  @post = Post.find(params[:id])
    end

end
