class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :dell_products, only: [:destroy]

  # GET /products
  # GET /products.json
  def index
    if !params[:filter_name].present? && !params[:filter_price].present? && !params[:filter_image].present? && !params[:filter_status].present?
      @products = Product.all
    else
      @products = Product.where(nil)
      @products = @products.pname(params[:filter_name]) if params[:filter_name].present?
      @products = @products.pprice(params[:filter_price]) if params[:filter_price].present?
      @products = @products.pimage(params[:filter_image]) if params[:filter_image].present?
      @products = @products.pstatus(params[:filter_status]) if params[:filter_status].present?
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    Product.destroy(dell_cats)
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # def filtering_params(params)
  #   params.slice(:filter_name, :filter_price, :filter_image,:filter_status)
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :image, :price, :status) if params[:product]
  end

  def dell_products
    if params[:selected].blank?
      redirect_to products_path
      flash[:notice]='No any product selected!'
    end
    params[:selected]
  end
end
