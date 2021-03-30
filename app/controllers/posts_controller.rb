class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path
        else
            render :new
        end
      
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path
    end

    def show
        @post = Post.find(params[:id])
    end
    private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
