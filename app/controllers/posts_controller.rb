class PostsController < ApplicationController
  before_action :check_authorization!

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.email = current_user.email
    @post.content = params[:input_content]
    @post.like_count = 0
    @post.save
    redirect_to post_path(@post.id)
  end

  def show
    @post = Post.find params[:id]
    @comments = Comment.where(post_id: @post.id)
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)

  end

  def update
    @post = Post.find params[:id]
    @post.user_id = params[:input_user]
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to post_path(@post)
  end

  # edit 아래부분 update로 이동
  def edit
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to '/'
  end

  # 좋아요
  def like

    # 좋아요를 누를 post 찾기
    @post = Post.find params[:id]
    @post.like_count += 1
    @post.save 

    # like 생성
    @like = Like.new
    @like.post_id = @post.id
    @like.user_id = current_user.id
    @like.save

    redirect_to post_path(@post)
  end

  # 싫어요 
  def dislike 
    
    @post = Post.find params[:id]
    @like = Like.find_by(post_id: @post.id)
    
    if @post.like_count - 1 >= 0
      @post.like_count -= 1 
      @like.destroy
    else
      @post.like_count = 0
    end

    @post.save

    redirect_to post_path(@post)
  end
end
