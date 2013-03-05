require 'test_helper'

class CustomizationsControllerTest < ActionController::TestCase
  setup do
    @customization_params = {
      lapel: 'peak',
      buttons: 2,
      vents: 1,
      pleats: 0,
      pant_cuffs: false,
      fit: 'tailored',
      lining: 'black',
      monogram: 'JB',
      pick_stitching: false,
      vest: false,
    }
  end

  test 'should be able to create a customization' do
    customization_count = Customization.count
    post :create, customization: @customization_params
    assert :success
    assert_equal Customization.count, customization_count + 1
    assert_equal @customization_params[:lapel], json_response['lapel']
  end

  test 'should be able to update a customization' do
    customization = customizations(:suit)
    put :update, id: customization.id, customization: @customization_params
    assert :success
    customization.reload
    assert_equal customization.lapel.to_s, @customization_params[:lapel]
    assert_equal @customization_params[:lapel], json_response['lapel']
  end

  test 'should be able to get a customization' do
    customization = customizations(:suit)
    get :show, id: customization.id
    assert :success
    assert_equal customization.lapel.to_s, json_response['lapel']
  end
end
