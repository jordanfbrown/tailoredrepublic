class ProductsController < ApplicationController
  load_and_authorize_resource except: [:show, :index]

  def index
    if params[:suggested]
      @products = Product.suggested(params[:product_id]).to_json(include: [:product_photos])
    else
      @products = Product.includes(:product_photos).order('category ASC, name ASC').all
    end

    respond_to do |format|
      format.json { render json: @products }
    end
  end

  def admin_index
    @products = Product.order('category ASC, name ASC').all
  end

  def show
    @product = Product.find(params[:id]) || (render_404 and return)
    @category = @product.category.to_s.pluralize
    @reviews = @product.paginated_reviews

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
    5.times { @product.product_photos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
    5.times { @product.product_photos.build }
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to :admin_index, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to edit_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
