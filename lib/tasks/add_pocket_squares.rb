namespace :db do
  namespace :add do
    task :pocket_squares => :environment do
      ash_floral = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      ash_floral.product_images.create!(
        large: 'ash-floral-large.png',
        regular: 'ash-floral-regular.png',
        thumbnail: 'ash-floral-thumbnail.png'
      )

      camo_encore = Product.create!(
        category: 'accessory',
        name: 'Camo Encore',
        summary: 'Camo encore summary',
        description: "Camo encore description",
        price: 449,
        quantity: 10
      )
      camo_encore.product_images.create!(
        large: 'camo-encore-large.png',
        regular: 'camo-encore-regular.png',
        thumbnail: 'camo-encore-thumbnail.png'
      )

      carolina = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      carolina.product_images.create!(
        large: 'carolina-large.png',
        regular: 'carolina-regular.png',
        thumbnail: 'carolina-thumbnail.png'
      )

      coral_linen = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      coral_linen.product_images.create!(
        large: 'coral-linen-large.png',
        regular: 'coral-linen-regular.png',
        thumbnail: 'coral-linen-thumbnail.png'
      )

      floral_rose_inverse = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      floral_rose_inverse.product_images.create!(
        large: 'floral-rose-inverse-large.png',
        regular: 'floral-rose-inverse-regular.png',
        thumbnail: 'floral-rose-inverse-thumbnail.png'
      )

      olive_floral = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      olive_floral.product_images.create!(
        large: 'olive-floral-large.png',
        regular: 'olive-floral-regular.png',
        thumbnail: 'olive-floral-thumbnail.png'
      )

      rose_floral = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      rose_floral.product_images.create!(
        large: 'rose-floral-large.png',
        regular: 'rose-floral-regular.png',
        thumbnail: 'rose-floral-thumbnail.png'
      )

      soft_pink = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      soft_pink.product_images.create!(
        large: 'soft-pink-large.png',
        regular: 'soft-pink-regular.png',
        thumbnail: 'soft-pink-thumbnail.png'
      )

      spring_fling = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      spring_fling.product_images.create!(
        large: 'spring-fling-large.png',
        regular: 'spring-fling-regular.png',
        thumbnail: 'spring-fling-thumbnail.png'
      )

      sunburst = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      sunburst.product_images.create!(
        large: 'sunburst-large.png',
        regular: 'sunburst-regular.png',
        thumbnail: 'sunburst-thumbnail.png'
      )

      winterfresh = Product.create!(
        category: 'accessory',
        name: 'Ash Floral',
        summary: 'Ash floral summary',
        description: "Ash floral description",
        price: 449,
        quantity: 10
      )
      winterfresh.product_images.create!(
        large: 'winterfresh-large.png',
        regular: 'winterfresh-regular.png',
        thumbnail: 'winterfresh-thumbnail.png'
      )
    end
  end
end