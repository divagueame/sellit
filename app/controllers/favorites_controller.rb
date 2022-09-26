class FavoritesController < ApplicationController
  def index
    # @favorites = Current.user.favorites
  end

  def create
    product.favorite!
    respond_to do |format|
      format.html do
        redirect_to product_path(product)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('favorite', partial: 'products/favorite', locals: { product: })
      end
    end
  end

  def destroy
    product.unfavorite!
    respond_to do |format|
      format.html do
        redirect_to product_path(product), status: :see_other # code 303 - Redirect to other
      end

      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('favorite', partial: 'products/favorite', locals: { product: })
      end
    end
  end

  private

  def product
    @product ||= Product.find(params[:product_id])
  end
end
