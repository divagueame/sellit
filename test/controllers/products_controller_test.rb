require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do 
    get products_path

    assert_response :success
    assert_select '.product', 4
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
        title: 'Chiki',
        description: "A good chiki",
        price: 250
      }
    }

    assert_redirected_to products_path
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


end
