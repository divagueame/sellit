class ProductsController < ApplicationController
  before_action :product, only: %i[show edit destroy update]
  skip_before_action :protect_pages, only: %i[index show]

  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 5)
  end

  def show; end

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
    authorize! product
  end

  def update
    authorize! product
    if @product.update(product_params)
      redirect_to products_path, notice: t('.notice')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! product
    @product.destroy

    redirect_to products_path, notice: t('.notice'), status: :see_other # code 303 - Redirect to other
  end

  def product
    @product ||= Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :main_photo, :category_id)
  end

  def product_params_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favorites, :user_id)
  end
end
