class CommentsController < ApplicationBaseController
  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @comment.user = current_user

    if @comment.save
      puts "saved comment"
      redirect_to @comment.job
    else
      puts "commenting failed"
      @comment.errors.each {|e|
        puts e
      }
      redirect_to @comment.job
    end
  end

  def index
    @comments = Comment.all
  end





  private
  def comment_params
    params.require(:comment).permit(:comment)
  end


end
