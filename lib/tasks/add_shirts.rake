namespace :db do
  namespace :add do
    task :shirts => :environment do
      %w(baldwin belmont belvedere berkeley beverly gilroy kodiak laguna lincoln malibu navigator pasadena pismo pomona
         presidential redondo rio rosemead).each do |shirt_name|
        Product.create!(
          category: 'shirt',
          name: "The Malibu",
          summary: 'Summary',
          description: "Description",
          price: 99,
          quantity: 10
        ).product_images.create!(
          large: "products/shirts/#{shirt_name}-large.jpg",
          regular: "products/shirts/#{shirt_name}-regular.jpg",
          thumbnail: "products/shirts/#{shirt_name}-thumbnail.jpg",
          default: true
        )
      end

      malibu = Product.find_by_name('The Malibu')
      malibu.product_images.first.update_attributes!(default: false)
      malibu.product_images.create!(
        large: "products/shirts/malibu-actual-large.png",
        regular: "products/shirts/malibu-actual-regular.png",
        thumbnail: "products/shirts/malibu-actual-thumbnail.png",
        default: true 
      )

      rosemead = Product.find_by_name('The Rosemead')
      rosemead.product_images.first.update_attributes!(default: false)
      rosemead.product_images.create!(
        large: "products/shirts/rosemead-actual-large.png",
        regular: "products/shirts/rosemead-actual-regular.png",
        thumbnail: "products/shirts/rosemead-actual-thumbnail.png",
        default: true
      )
    end
  end
end