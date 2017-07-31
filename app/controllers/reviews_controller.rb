class ReviewsController < ApplicationBaseController

  before_action :authorize

  def create
    @review = Review.new(review_params)
    @review.user_id = params[:user_id]
    @review.user_by = current_user.id
    @review.user_about = @review.user_id

    if @review.save
      redirect_to controller: 'users', action: 'show', id: @review.user_id
    else
      redirect_to controller: 'users', action: 'show', id: @review.user_id
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    @product = Product.find params[:user_id]
    redirect_to [@user], notice: 'Review deleted'
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end