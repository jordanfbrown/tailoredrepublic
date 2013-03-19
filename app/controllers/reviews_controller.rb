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
    if user_signed_in?
      @reviews = current_user.paginated_reviews(params[:page] ||= 1)
    else
      redirect_to root_path
    end
  end

  def new
    @product = Product.find_by_name(params[:product_id].titleize) || (render_404 and return)
    @review = @product.reviews.build
  end

  def edit
    @product = Product.find_by_name(params[:product_id].titleize) || (render_404 and return)
    @review = current_user.reviews.find(params[:id]) || (render_404 and return)
  rescue ActiveRecord::RecordNotFound
    render_404 and return
  end

  def create
    @product = Product.find(params[:review][:product_id]) || (render_404 and return)
    @review = Review.new(params[:review])
    @review.status = 'pending'
    @review.user = current_user

    if @review.save
      redirect_to "/products/#{@review.product.slug}", notice: 'Your review has been submitted and is now pending approval.'
    else
      render :new
    end
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

  def ensure_signed_in
    redirect_to root_path unless user_signed_in?
  end
end