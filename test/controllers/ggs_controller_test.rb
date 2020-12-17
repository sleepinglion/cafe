require 'test_helper'

class GgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gg = ggs(:one)
  end

  test "should get index" do
    get ggs_url
    assert_response :success
  end

  test "should get new" do
    get new_gg_url
    assert_response :success
  end

  test "should create gg" do
    assert_difference('Gg.count') do
      post ggs_url, params: { gg: {  } }
    end

    assert_redirected_to gg_url(Gg.last)
  end

  test "should show gg" do
    get gg_url(@gg)
    assert_response :success
  end

  test "should get edit" do
    get edit_gg_url(@gg)
    assert_response :success
  end

  test "should update gg" do
    patch gg_url(@gg), params: { gg: {  } }
    assert_redirected_to gg_url(@gg)
  end

  test "should destroy gg" do
    assert_difference('Gg.count', -1) do
      delete gg_url(@gg)
    end

    assert_redirected_to ggs_url
  end
end
