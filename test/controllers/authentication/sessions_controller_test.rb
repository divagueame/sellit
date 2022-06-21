require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:john)
    end
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create login user by email" do
    
    post sessions_url, params: { login: @user.email, password: 'testme' }
      
    assert_redirected_to products_url
  end 

  test "should create login user by username" do
    
    post sessions_url, params: { login: @user.username, password: 'testme' }
      
    assert_redirected_to products_url
  end 

  test "should logout" do
    login
    
    delete session_url(@user.id)
    assert_redirected_to products_url
    assert_equal flash[:notice], 'Session closed'
  end
end
