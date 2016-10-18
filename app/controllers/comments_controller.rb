class CommentsController < ApplicationController
  def create
    # @inquiry = Inquiry.find(params[:inquiry_id])
    # @comment = @inquiry.comments.create(comment_params)
    # redirect_to inquiry_path(@inquiry)
    p "hit the new comment endpoint"
    p "============================"
    p params 
    p "============================"

    comment = Comment.new 
    comment.body = params[:body]
    comment.commenter = params[:author]
    comment.internal_only = params[:internal_only]


    @inquiry = Inquiry.find(params[:inquiry_id])
    if @inquiry.comments.push(comment)
      p "-----"
      p "after i save its "
      p comment
      p "-----"
      render :json => { :success => true, :inquiry_id => @inquiry.id, :comment_id => comment.id }
    else 
      render :json => { :success => false }
    end
  end

  def destroy
    p "hit the destroy endpoint"
    @inquiry = Inquiry.find(params[:inquiry_id])
    @comment = @inquiry.comments.find(params[:id])
    @comment.destroy
    redirect_to inquiry_path(@inquiry)
  end

  def edit
    @inquiry = Inquiry.find(params[:inquiry_id])
    @comment = Comment.find(params[:id]) 
  end

  def update 
    @inquiry = Inquiry.find(params[:inquiry_id])
    @comment = Comment.find(params[:id]) 
    @comment.body = comment_params[:body]
    @comment.commenter = comment_params[:commenter]
    if comment_params[:internal_only] === "1" 
      @comment.internal_only = true 
    else 
      @comment.internal_only = false 
    end
    @comment.save 

    redirect_to inquiry_path(@inquiry)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :internal_only)
    end
end