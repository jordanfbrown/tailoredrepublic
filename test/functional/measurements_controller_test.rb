require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase
  setup do
    @measurement_params = {
      neck: 15.5, chest: 38.25, stomach: 34.5, waist: 34, hips: 40.5, full_shoulders: 19, back: 16.25,
      arm_length: 24.25, bicep: 12, wrist: 6.75, jacket_length: 28.5, crotch: 27.5, thigh: 24, pant_length: 40.25,
      age: 35, weight: 160, height: 60
    }
  end

  test "the show action should return the current user's measurements if they're signed in" do
    user = users(:user_with_stripe)
    sign_in :user, user
    get :show
    assert_equal assigns(:measurement), user.measurement
  end

  test "the show action should build new measurements if the user is signed in but has no measurements" do
    user = users(:admin)
    sign_in :user, user
    get :show
    assert_equal assigns(:measurement).user_id, user.id
    assert assigns(:measurement).new_record?
  end

  test "if a user is not signed in, but there is a measurement in the session, it should retrieve it" do
    measurement = measurements(:one)
    get :show, {}, { measurement_id: measurement.id }
    assert_equal assigns(:measurement), measurement
  end

  test "if a measurement id is in the session but no record can be found, a new measurement should be returned" do
    get :show, {}, { measurement_id: 1234 }
    assert assigns(:measurement).new_record?
    assert_nil assigns(:measurement).user_id
  end
  
  test "should be able to create new measurements, and they should be stored in the session afterwards" do
    post :create, measurement: @measurement_params
    assert_response :success
    assert_equal json_response['neck'], @measurement_params[:neck].to_s
    assert_equal json_response['id'], session[:measurement_id]
  end

  test "when a logged in user creates measurements, they should be associated with that user" do
    user = users(:admin)
    sign_in :user, user
    post :create, measurement: @measurement_params
    assert_equal json_response['user_id'], user.id
  end

  test "bad measurements should return an unprocessable entity error" do
    params = @measurement_params
    params[:neck] = -1
    post :create, measurement: params
    assert_response 422
    assert_not_nil json_response['neck']
  end

  test "a logged in user should be able to update their measurements" do
    user = users(:user_without_stripe)
    old_measurement = user.measurement
    sign_in :user, user
    put :update, measurement: @measurement_params
    assert_response :success
    assert_not_equal json_response['neck'], old_measurement.neck.to_s
    assert_equal json_response['neck'], @measurement_params[:neck].to_s
  end

  test "a non-logged in user with measurements in the session should be able to update them" do
    measurement = measurements(:two)
    put :update, { measurement: @measurement_params }, { measurement_id: measurement.id }
    assert_response :success
    assert_not_equal json_response['neck'], measurement.neck.to_s
    assert_equal json_response['neck'], @measurement_params[:neck].to_s
  end

  test "if a user is not logged in and there are no measurements in the session, it should return a 500 error" do
    put :update, { measurement: @measurement_params }
    assert_response :error
  end

  test "if bad measurements are passed to update, it should return a 422 error" do
    params = @measurement_params
    params[:neck] = -1
    user = users(:user_without_stripe)
    sign_in :user, user
    put :update, measurement: @measurement_params
    assert_response 422
    assert_not_nil json_response['neck']
  end
end
