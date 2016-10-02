require 'test_helper'

class AuditoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auditorium = auditoria(:one)
  end

  test "should get index" do
    get auditoria_url
    assert_response :success
  end

  test "should get new" do
    get new_auditorium_url
    assert_response :success
  end

  test "should create auditorium" do
    assert_difference('Auditorium.count') do
      post auditoria_url, params: { auditorium: { capacity: @auditorium.capacity } }
    end

    assert_redirected_to auditorium_url(Auditorium.last)
  end

  test "should show auditorium" do
    get auditorium_url(@auditorium)
    assert_response :success
  end

  test "should get edit" do
    get edit_auditorium_url(@auditorium)
    assert_response :success
  end

  test "should update auditorium" do
    patch auditorium_url(@auditorium), params: { auditorium: { capacity: @auditorium.capacity } }
    assert_redirected_to auditorium_url(@auditorium)
  end

  test "should destroy auditorium" do
    assert_difference('Auditorium.count', -1) do
      delete auditorium_url(@auditorium)
    end

    assert_redirected_to auditoria_url
  end
end
