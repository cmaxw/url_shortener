require "test_helper"

class RedirectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redirection = redirections(:one)
  end

  test "should get index" do
    get redirections_url
    assert_response :success
  end

  test "should get new" do
    get new_redirection_url
    assert_response :success
  end

  test "should create redirection" do
    assert_difference("Redirection.count") do
      post redirections_url, params: { redirection: { destination_url: @redirection.destination_url, source_path: @redirection.source_path } }
    end

    assert_redirected_to redirection_url(Redirection.last)
  end

  test "should show redirection" do
    get redirection_url(@redirection)
    assert_response :success
  end

  test "should get edit" do
    get edit_redirection_url(@redirection)
    assert_response :success
  end

  test "should update redirection" do
    patch redirection_url(@redirection), params: { redirection: { destination_url: @redirection.destination_url, source_path: @redirection.source_path } }
    assert_redirected_to redirection_url(@redirection)
  end

  test "should destroy redirection" do
    assert_difference("Redirection.count", -1) do
      delete redirection_url(@redirection)
    end

    assert_redirected_to redirections_url
  end
end
