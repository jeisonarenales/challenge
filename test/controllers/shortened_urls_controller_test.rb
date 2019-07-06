require 'test_helper'

class ShortenedUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shortened_url = shortened_urls(:one)
  end

  test "should get index" do
    get shortened_urls_url, as: :json
    assert_response :success
  end

  test "should create shortened_url" do
    assert_difference('ShortenedUrl.count') do
      post shortened_urls_url, params: { shortened_url: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show shortened_url" do
    get shortened_url_url(@shortened_url), as: :json
    assert_response :success
  end

  test "should update shortened_url" do
    patch shortened_url_url(@shortened_url), params: { shortened_url: {  } }, as: :json
    assert_response 200
  end

  test "should destroy shortened_url" do
    assert_difference('ShortenedUrl.count', -1) do
      delete shortened_url_url(@shortened_url), as: :json
    end

    assert_response 204
  end
end
