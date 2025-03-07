class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # flash[:success] = "Comment successfully created"
      redirect_to prototype_path(@comment.prototype)
    else
      # flash[:error] = "Something went wrong"
      render prototype_path(@comment.prototype), status: :unprocessable_entity
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end