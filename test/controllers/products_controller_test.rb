require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do 
    get products_path
    
    assert_response :success
    assert_select '.product', 4
    assert_select '.category', 4
  end

  test 'renders a list of products filtered by category' do
    get products_path(category_id: categories(:autos).id)

    assert_response :success
    assert_select '.product', 1
  end

  test 'renders a list of products filtered by min and max price' do
    get products_path(min_price: 100, max_price: 1000)

    assert_response :success
    assert_select '.product', 1
    assert_select 'h2', 'Dog leash'
  end

  test 'renders show page with details of a product' do
    get product_path(products(:Car))

    assert_response :success
    assert_select '.title', 'Car'
  end

  test 'page renders a form' do
    get new_product_path

    assert_response :success
    assert_select 'form', 1 
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'Dog cage',
        description: "A good chiki cage",
        price: 250,
        category_id: categories(:pets).id
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product added successfully'
  end

  test 'does not allow to create products with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: "A good chiki",
        price: 250
      }
    }

    assert_response :unprocessable_entity
  end

  test 'renders an edit form' do
    get edit_product_path(products(:Car))

    assert_response :success
    assert_select 'form', 1 
  end

  test 'allow to update a product' do
    patch product_path(products(:Car)), params: {
      product: {
        price: 100
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product Updated!'
  end


  test 'does not allow to update a product with invalid field' do
    patch product_path(products(:Car)), params: {
      product: {
        price: nil
      }
    }
    assert_response :unprocessable_entity
  end

  test 'can delete products' do 
    assert_difference('Product.count', -1) do
      delete product_path(products(:Car))
    end
    assert_redirected_to products_path
    assert_equal flash[:notice], 'Product deleted'
  end
end
