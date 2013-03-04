class ProductPhoto < ActiveRecord::Base
  belongs_to :product
  attr_accessible :default_photo, :product_id, :photo

  Paperclip.interpolates :path do |attachment, style|
    category = ActiveSupport::Inflector.pluralize(attachment.instance.product.category)
    "/products/#{category}/#{attachment.instance.product.id}"
  end

  Paperclip.interpolates :timestamp do |attachment, style|
    attachment.instance.created_at.to_i
  end

  has_attached_file :photo, path: ':path/:style/:basename-:timestamp.:extension',
                    styles: { medium: '300x', small: '100x' }
  validates_attachment_presence :photo
  validates_attachment_size :photo, less_than: 5.megabytes
  validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']
end
