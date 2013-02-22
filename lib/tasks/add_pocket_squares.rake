namespace :db do
  namespace :add do
    task :pocket_squares => :environment do
      ashworth = Product.create!(
        category: 'accessory',
        name: 'The Ashworth',
        summary: '100% Cotton',
        description: "A light gray pocket square can keep things subtle, while the floral pattern keeps it fun.",
        price: 20,
        quantity: 10
      )
      ashworth.product_images.create!(
        large: 'products/accessories/pocket_squares/ashworth-large.png',
        regular: 'products/accessories/pocket_squares/ashworth-regular.png',
        thumbnail: 'products/accessories/pocket_squares/ashworth-thumbnail.png',
        default: true
      )

      cameoflage = Product.create!(
        category: 'accessory',
        name: 'Cameoflage',
        summary: '100% Cotton',
        description: "Use this square wisely and you will be the envy of the party. Add flare to a black, gray, or brown suit with this guy.",
        price: 20,
        quantity: 10
      )
      cameoflage.product_images.create!(
        large: 'products/accessories/pocket_squares/cameoflage-large.png',
        regular: 'products/accessories/pocket_squares/cameoflage-regular.png',
        thumbnail: 'products/accessories/pocket_squares/cameoflage-thumbnail.png',
        default: true
      )

      carolina = Product.create!(
        category: 'accessory',
        name: 'Carolina Blue',
        summary: '100% Cotton',
        description: "Blues and grays play nicely. Without patterns to distract, our solid squares are all about the bold colors.",
        price: 20,
        quantity: 10
      )
      carolina.product_images.create!(
        large: 'products/accessories/pocket_squares/carolina-blue-large.png',
        regular: 'products/accessories/pocket_squares/carolina-blue-regular.png',
        thumbnail: 'products/accessories/pocket_squares/carolina-blue-thumbnail.png',
        default: true
      )

      coral_floral = Product.create!(
        category: 'accessory',
        name: 'Coral Floral',
        summary: '100% Cotton',
        description: "Your pockets shall be bold the boldest in the room with this coral square.",
        price: 20,
        quantity: 10
      )
      coral_floral.product_images.create!(
        large: 'products/accessories/pocket_squares/coral-floral-large.png',
        regular: 'products/accessories/pocket_squares/coral-floral-regular.png',
        thumbnail: 'products/accessories/pocket_squares/coral-floral-thumbnail.png',
        default: true
      )

      coral_linen = Product.create!(
        category: 'accessory',
        name: 'Coral Linen',
        summary: '100% Linen',
        description: "Tis' the spring season and this square is sure to turn heads at the Easter service. Gray and charcoal lend themselves exceptionally to these pinker shades.",
        price: 20,
        quantity: 10
      )
      coral_linen.product_images.create!(
        large: 'products/accessories/pocket_squares/coral-linen-large.png',
        regular: 'products/accessories/pocket_squares/coral-linen-regular.png',
        thumbnail: 'products/accessories/pocket_squares/coral-linen-thumbnail.png',
        default: true
      )

      icy_white = Product.create!(
        category: 'accessory',
        name: 'Icy White',
        summary: '100% Cotton',
        description: "Sometimes keeping it simple is the way to go. Throw this on a tuxedo or 3 piece black suit to dress your pocket up without distracting from the main attraction.",
        price: 20,
        quantity: 10
      )
      icy_white.product_images.create!(
        large: 'products/accessories/pocket_squares/icy-white-large.png',
        regular: 'products/accessories/pocket_squares/icy-white-regular.png',
        thumbnail: 'products/accessories/pocket_squares/icy-white-thumbnail.png',
        default: true
      )

      mint_chocolate_chip = Product.create!(
        category: 'accessory',
        name: 'Mint Chocolate Chip',
        summary: '100% Cotton',
        description: "Turquoise and brown will need to be paired wisely, but this square is a beauty.",
        price: 20,
        quantity: 10
      )
      mint_chocolate_chip.product_images.create!(
        large: 'products/accessories/pocket_squares/mint-chocolate-chip-large.png',
        regular: 'products/accessories/pocket_squares/mint-chocolate-chip-regular.png',
        thumbnail: 'products/accessories/pocket_squares/mint-chocolate-chip-thumbnail.png',
        default: true
      )

      olive_floral = Product.create!(
        category: 'accessory',
        name: 'Olive To See Tomorrow',
        summary: '100% Cotton',
        description: "Keep it earthy with this floral patterned olive pocket square. Pair with other earth tones; browns, grays, and muted blues.",
        price: 20,
        quantity: 10
      )
      olive_floral.product_images.create!(
        large: 'products/accessories/pocket_squares/olive-floral-large.png',
        regular: 'products/accessories/pocket_squares/olive-floral-regular.png',
        thumbnail: 'products/accessories/pocket_squares/olive-floral-thumbnail.png',
        default: true
      )

      pastel_pink = Product.create!(
        category: 'accessory',
        name: 'Pastel Pink',
        summary: '100% Cotton',
        description: 'As our style guru likes to say, "there is nothing more masculine than a man that can pull off a touch of pink".',
        price: 20,
        quantity: 10
      )
      pastel_pink.product_images.create!(
        large: 'products/accessories/pocket_squares/pastel-pink-large.png',
        regular: 'products/accessories/pocket_squares/pastel-pink-regular.png',
        thumbnail: 'products/accessories/pocket_squares/pastel-pink-thumbnail.png',
        default: true
      )

      pastellion = Product.create!(
        category: 'accessory',
        name: 'Pastellion',
        summary: '100% Cotton',
        description: "Pastel pink and a floral pattern, two ways to show that you are completely confident in your style game. And don't worry; we got your back on this choice.",
        price: 20,
        quantity: 10
      )
      pastellion.product_images.create!(
        large: 'products/accessories/pocket_squares/pastellion-large.png',
        regular: 'products/accessories/pocket_squares/pastellion-regular.png',
        thumbnail: 'products/accessories/pocket_squares/pastellion-thumbnail.png',
        default: true
      )

      spring_fling = Product.create!(
        category: 'accessory',
        name: 'Spring Fling',
        summary: '100% Cotton',
        description: "A bold pocket square if there ever was one. Pull this beast out of your pocket a little further than normal and watch people's pupils dilate.",
        price: 20,
        quantity: 10
      )
      spring_fling.product_images.create!(
        large: 'products/accessories/pocket_squares/spring-fling-large.png',
        regular: 'products/accessories/pocket_squares/spring-fling-regular.png',
        thumbnail: 'products/accessories/pocket_squares/spring-fling-thumbnail.png',
        default: true
      )

      sunburst = Product.create!(
        category: 'accessory',
        name: 'Sunburst Yellow',
        summary: '100% Cotton',
        description: "Bold, solid colors can kill the game. Use this to bring out some yellows in the tie you are wearing. A navy suit will really pop if paired with this square.",
        price: 20,
        quantity: 10
      )
      sunburst.product_images.create!(
        large: 'products/accessories/pocket_squares/sunburst-yellow-large.png',
        regular: 'products/accessories/pocket_squares/sunburst-yellow-regular.png',
        thumbnail: 'products/accessories/pocket_squares/sunburst-yellow-thumbnail.png',
        default: true
      )
    end
  end
end