class ReviewMailer < ActionMailer::Base
  default from: '"Tailored Republic" <info@tailoredrepublic.com>'

  def new_review_email(review)
    @review = review

    if Rails.env.development?
      mail to: 'jordan@tailoredrepublic.com', subject: 'New product review'
    else
      mail to: 'info@tailoredrepublic.com', subject: 'New product review'
    end
  end
end
