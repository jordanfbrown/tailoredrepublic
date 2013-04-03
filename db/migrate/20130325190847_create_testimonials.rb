class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.attachment :photo
      t.string :caption
      t.string :social_handle
      t.string :social_url

      t.timestamps
    end
  end
end
