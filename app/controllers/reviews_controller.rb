class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:admin_index]
  before_filter :ensure_signed_in

  def admin_index
    params[:filter] ||= 'all'
    params[:page] ||= 1
    @filter = params[:filter]
    @reviews = Review.filter_by_status(@filter, params[:page])
  end

  def index
    @reviews = current_user.paginated_reviews(params[:page] ||= 1)
  end

  def new
    @product = Product.find(params[:product_id])
    redirect_to @product and return unless current_user.can_review_product?(@product)
    @review = @product.reviews.build
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = current_user.reviews.find(params[:id]) || (render_404 and return)
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def create
    @product = Product.find(params[:review][:product_id])
    redirect_to @product and return unless current_user.can_review_product?(@product)
    @review = Review.new(params[:review])
    @review.status = 'pending'
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: 'Your review has been submitted and is now pending approval.'
    else
      render :new
    end
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def update
    if user_signed_in? && current_user.admin?
      @review = Review.find(params[:id])
    else
      @review = current_user.reviews.find(params[:id])
    end

    if @review.update_attributes(params[:review])
      if request.xhr?
        head :no_content
      else
        @review.update_attributes(status: 'pending')
        redirect_to reviews_path, notice: 'Your review has been updated and is now pending approval.'
      end
    else
      @product = @review.product
      if request.xhr?
        render json: @review.errors, status: :unprocessable_entity
      else
        render :edit
      end
    end
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def paginated
    product = Product.find(params[:product_id])
    @reviews = product.paginated_reviews(params[:page] ||= 1)
    render partial: 'review_list', locals: { reviews: @reviews }
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def ensure_signed_in
    redirect_to root_path unless user_signed_in?
  end
end