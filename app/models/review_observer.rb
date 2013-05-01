class ReviewObserver < ActiveRecord::Observer
  def after_create(review)
    ReviewMailer.new_review_email(review).deliver
  end
end
