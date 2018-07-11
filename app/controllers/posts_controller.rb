class PostsController < ApplicationController

  before_action :fetch_post, only: [:show, :destroy, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @user = get_logged_in_user
    @beer_names = Beer.all.map {|b| b.name}
    @brewery_names = Beer.all.map {|b| b.brewery}.uniq
    @post = Post.new

    @beer = Beer.new
  end

  def create
    # byebug

    @user = get_logged_in_user
    # @beer_names = Beer.all.map {|b| b.name}
    # @brewery_names = Beer.all.map {|b| b.brewery}.uniq
    # if Beer.find_by(name: post_params(beer_attributes: [:name]))
    #   @beer = Beer.find_by(name: post_params(beer_attributes: [:name]))
    #   @post = Post.new(post_params(:description, :situation,))
    #   if @beer.invalid?
    #     render :new
    #   else
    #     @beer.save
    #   end
    #   @post.beer = @beer
    # else
    @post = Post.new(post_params(:description, :image_file, :situation, :user_id, :beer_id))
    if @post.save(post_params(:description, :image_file, :situation, :user_id, :beer_id))
      redirect_to post_path(@post)
    else
      # byebug
      redirect_to beer_path(@post.beer_id) # this seems a little weird, but I couldn't find another way to access beer_id
    end
    # end
    # if @post.invalid?
    #   render :new
    # end
    # @post.beer.save # maybe necessary to run next line?
    # @post.save
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params(:description, :situation, :image_file))
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
