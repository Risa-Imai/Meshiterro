class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    #上記１行は下記２行の省略形
    #comment = PostComment.new(post_comment_params)
    #comment.user_id = curret_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end

