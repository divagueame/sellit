class ProductsController < ApplicationController
  before_action :product, only: [:show,:edit,:destroy, :update]
  def index
    @products = Product.all.order(:created_at).with_attached_main_photo
  end
  def show
  end

  def new
    @product = Product.new 
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save 
      redirect_to products_path, notice: t('.notice')
    else
      render :new, status: :unprocessable_entity, alert: t('.alert')
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      redirect_to products_path, notice: t('.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path, notice: t('.notice'), status: :see_other # code 303 - Redirect to other
  end

  def product
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :main_photo)
  end

end
