class PostsController < ApplicationController

  before_action :fetch_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @beer_names = Beer.all.map {|b| b.name}
    @brewery_names = Beer.all.map {|b| b.brewery}.uniq
    @post = Post.new
    @beer = Beer.new
  end

  def create
    @post = Post.new(post_params(:description, :situation, beer_attributes: [:name, :brewery, :style, :abv]))
    if @post.invalid?
      render :new
    end
    @post.beer.save # maybe necessary to run next line?
    @post.save
    redirect_to post_path(@post)
  end

  def show; end

  def edit; end

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
