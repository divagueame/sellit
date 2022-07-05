require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    # login
    # @category = categories(:autos)
  end

  test 'visiting the index' do
    # visit categories_url
    # assert_selector 'h1', text: 'Categories'
  end

  test 'should create category' do
    # visit categories_url
    # click_on "New category"

    # fill_in "Name", with: 'Chiki'
    # click_on "Create Category"

    # assert_text "Category was successfully created"
  end

  test 'should update Category' do
    # visit categories_url(@category)
    # click_on "Edit", match: :first

    # fill_in "Name", with: 'Updatedname ' + @category.name
    # click_on "Update Category"

    # assert_text "Category was successfully updated"
  end
end
