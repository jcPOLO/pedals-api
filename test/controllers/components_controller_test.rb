require 'test_helper'

class ComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component = components(:one)
  end

  test "should get index" do
    get components_url, as: :json
    assert_response :success
  end

  test "should create component" do
    assert_difference('Component.count') do
      post components_url, params: { component: { legs: @component.legs, log: @component.log, rev: @component.rev, value: @component.value } }, as: :json
    end

    assert_response 201
  end

  test "should show component" do
    get component_url(@component), as: :json
    assert_response :success
  end

  test "should update component" do
    patch component_url(@component), params: { component: { legs: @component.legs, log: @component.log, rev: @component.rev, value: @component.value } }, as: :json
    assert_response 200
  end

  test "should destroy component" do
    assert_difference('Component.count', -1) do
      delete component_url(@component), as: :json
    end

    assert_response 204
  end
end
