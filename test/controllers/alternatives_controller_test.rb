require "test_helper"

class AlternativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alternative = alternatives(:one)
  end

  test "should get index" do
    get alternatives_url
    assert_response :success
  end

  test "should get new" do
    get new_alternative_url
    assert_response :success
  end

  test "should create alternative" do
    assert_difference("Alternative.count") do
      post alternatives_url, params: { alternative: { image_data: @alternative.image_data, orginal_url: @alternative.orginal_url, original_source: @alternative.original_source, title: @alternative.title, user_id: @alternative.user_id, verified: @alternative.verified } }
    end

    assert_redirected_to alternative_url(Alternative.last)
  end

  test "should show alternative" do
    get alternative_url(@alternative)
    assert_response :success
  end

  test "should get edit" do
    get edit_alternative_url(@alternative)
    assert_response :success
  end

  test "should update alternative" do
    patch alternative_url(@alternative), params: { alternative: { image_data: @alternative.image_data, orginal_url: @alternative.orginal_url, original_source: @alternative.original_source, title: @alternative.title, user_id: @alternative.user_id, verified: @alternative.verified } }
    assert_redirected_to alternative_url(@alternative)
  end

  test "should destroy alternative" do
    assert_difference("Alternative.count", -1) do
      delete alternative_url(@alternative)
    end

    assert_redirected_to alternatives_url
  end
end
