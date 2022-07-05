require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    # login
    @user = users(:john)
  end

  test 'should get show' do
    get user_path(@user.username)
    assert_response :success
  end
end
