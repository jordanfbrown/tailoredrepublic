class Testimonial < ActiveRecord::Base
  attr_accessible :photo, :caption, :social_handle, :social_url

  default_scope order('created_at DESC')

  has_attached_file :photo, path: '/testimonials/:style/:basename.:extension',
                    styles: { medium: '300x', small: '100x' }
  validates_attachment_presence :photo
  validates_attachment_size :photo, less_than: 5.megabytes
  validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']
  validates :caption,  length: { minimum: 1, maximum: 200 }

  self.per_page = 20

  def has_social?
    !social_handle.nil? && !social_url.nil?
  end
end
