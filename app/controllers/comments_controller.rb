class CommentsController < ApplicationController

  def create
    comment = Comment.new 
    comment.body = params[:body]
    comment.commenter = params[:author]
    comment.internal_only = params[:internal_only]

    @inquiry = Inquiry.find(params[:inquiry_id])

    p "preparing to send - in controller"
    p "------------"

    InquiryMailer.comment_entered(comment, @inquiry).deliver

    if @inquiry.comments.push(comment)
      render :json => { :success => true, :inquiry_id => @inquiry.id, :comment_id => comment.id }
    else 
      render :json => { :success => false }
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:inquiry_id])
    @comment = @inquiry.comments.find(params[:id])
    @comment.destroy

    redirect_to inquiry_path(@inquiry, :ip => "review") 
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

    redirect_to inquiry_path(@inquiry, :ip => "review")
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :internal_only, :ip)
    end
end