class FavoritesController < ApplicationController
  def index
    # @favorites = Current.user.favorites
  end

  def create
    product.favorite!
    redirect_to product_path(product)
  end

  def destroy
    product.unfavorite!
    redirect_to product_path(product), status: :see_other # code 303 - Redirect to other
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
