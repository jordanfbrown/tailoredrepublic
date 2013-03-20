class ProductsController < ApplicationController
  load_and_authorize_resource except: [:show, :index]

  # GET /products
  # GET /products.json
  def index
    if params[:suggested]
      @products = Product.suggested(params[:product_id]).to_json(include: [:product_photos])
    else
      @products = Product.order('category ASC, name ASC').all
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
    @reviews = @product.reviews.accepted

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    5.times { @product.product_photos.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    5.times { @product.product_photos.build }
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to action: "index", notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
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

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
