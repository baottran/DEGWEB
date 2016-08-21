class CommentsController < ApplicationController
  def create
    # @inquiry = Inquiry.find(params[:inquiry_id])
    # @comment = @inquiry.comments.create(comment_params)
    # redirect_to inquiry_path(@inquiry)
    p "hit the new comment endpoint"
    p "param body is #{params[:body]}"
    @inquiry = Inquiry.find(params[:inquiry_id])
    @inquiry.comments.create(body: params[:body], commenter: params[:author])
    render :json => { :success => true}
  end

  def destroy
    @inquiry = Inquiry.find(params[:inquiry_id])
    @comment = @inquiry.comments.find(params[:id])
    @comment.destroy
    redirect_to inquiry_path(@inquiry)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end