class PostsController < ApplicationController

  before_action :fetch_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @brewery = Brewery.find_or_create_by(post_params(:brewery[:name], :brewery[:city], :brewery[:state]))
    @beer = Beer.find_or_create_by(post_params(:beer[:name], :beer[:style]))
    @brewery.beers << @beer
    @post = Post.new(post_params(:description, :situation))
    @beer.posts << @post
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params(:description, :situation))
      redirect_to @post #change to account creation path
    else
      render :edit
    end
  end

  def destroy
    @user = @post.user
    @post.destroy
    redirect_to @user
  end

  private
  def post_params(*args)
    params.require(:post).permit(args)
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
