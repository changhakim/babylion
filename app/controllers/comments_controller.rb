class CommentsController < ApplicationController
  before_action :check_authorization!

  def create
    @comment = Comment.new
    # params :comment_ xxx 로 변경
    @comment.user_id = params[:comment_user_id]
    @comment.post_id = params[:comment_post_id]
    @comment.content = params[:comment_content]
    @comment.save
    redirect_to post_path(@comment.post_id) # 생성 후 해당 post로 리다이렉션
  end

  def destroy
    # where절을 find로 변경
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id]) # 삭제 후 해당 post로 리다이렉션
  end
end
