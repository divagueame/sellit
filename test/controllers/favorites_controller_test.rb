require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    login
    @user = users(:john)
    @product = products(:Laptop)
    @favorited_product = products(:Car)
  end

  test 'should return my favorites' do
    get favorites_url
    assert_response :success
  end

  test 'should not create duplicated favorites' do
    @existing_product = products(:Screen)
    post favorites_path(product_id: @product.id)
    assert_redirected_to product_path(@product)
  end

  test 'should undo favorite' do
    assert_difference('Favorite.count', -1) do
      delete favorite_path(@favorited_product.id)
    end
    assert_redirected_to product_path(@favorited_product)
  end
end
