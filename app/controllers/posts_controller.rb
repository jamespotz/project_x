class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.includes(:comments).all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, :notice => "Title/Description cant be blank."
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit, :notice => "Title/Description cant be blank."
    end
  end

  def delete
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :thumbnail, :tag)
    end
end
