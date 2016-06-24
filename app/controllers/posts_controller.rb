class PostsController < ApplicationController
	def new 
		@post = Post.new 
	end

	def edit
  	@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	 
	  if @post.update(post_params)
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def create
	  @post = Post.new(post_params)

	  @post.save

	  if @post.save
	    redirect_to @post
	  else
	    render 'new'
	  end
	end

	def show
	  @post = Post.find(params[:id])
	end

	def index
		@posts = Post.all 
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text)
	  end

end
