require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:user_with_stripe)
    @review_params = {
      product_id: ActiveRecord::Fixtures.identify(:jetsetter),
      summary: 'Really good suit',
      rating: 5
    }
  end

  test "user who is not admin should be redirected when attempting to go to admin_index" do
    get :admin_index
    assert_response :redirect
  end

  test "user who is admin should load admin_index successfully" do
    sign_in :user, users(:admin)
    get :admin_index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "index should load all of the reviews for the logged in user" do
    get :index
    assert_response :success
    assert_operator assigns(:reviews).length, :>, 0
  end

  test "new should successfully load a product and create a review association for that product" do
    product = products(:jetsetter)
    get :new, product_id: product.id
    assert_response :success
    assert_equal product, assigns(:product)
    assert_equal product, assigns(:review).product
  end

  test "new should throw a 404 error if a bad product id is passed in" do
    get :new, product_id: 1251212
    assert_response 404
  end

  test "edit should successfully load a product and its associated review" do
    review = reviews(:executive_review_one)
    get :edit, product_id: review.product.id, id: review.id
    assert_response :success
    assert_equal review.product, assigns(:review).product
    assert_equal review, assigns(:review)
  end

  test "if a user tries to edit a review that wasnt created by them, a 404 error should be thrown" do
    review = reviews(:executive_review_one)
    sign_in :user, users(:user_without_stripe)
    get :edit, product_id: review.product.id, id: review.id
    assert_response 404
  end

  test "edit should throw a 404 if a bad review id is passed in" do
    review = reviews(:executive_review_one)
    get :edit, product_id: review.product.id, id: 12847214
    assert_response 404
  end

  test "create should create a new review, set its status to pending, and attach it to the signed in user" do
    product = products(:jetsetter)
    user = users(:user_without_stripe)
    sign_in :user, user
    post :create, review: @review_params
    assert_equal product, assigns(:review).product
    assert_equal user, assigns(:review).user
    assert_equal 5, assigns(:review).rating
    assert_equal 'pending', assigns(:review).status
    assert_response :redirect
  end
end
