puts 'Creating user jordan@tailoredrepublic.com -- don\'t forget to change password!'
User.create!(name: 'Jordan Brown', email: 'jordan@tailoredrepublic.com', password: 'changeme123', role: 'admin')

puts 'Creating products'
black = Product.create!(
  category: 'suit',
  name: 'The Executive',
  summary: 'Quintessential Black, 100% Wool',
  description: "There is no way around it; a black suit needs to be a staple of everybody's wardrobe. Things become classics for a reason, because they look damn good. A properly tailored black suit will have heads nodding with respect at how well you pulled off a classic look. Throw on a peak lapel or make it a three-piece to add a fashionable twist to your bread and butter.",
  price: 349,
  quantity: 10
)

navy = Product.create!(
  category: 'suit',
  name: 'The Entrepreneur',
  summary: 'Deep Navy, 100% Wool',
  description: "A nice deep navy is the way to go. Sport it during the day with a brown belt and shoes and really let the blue pop. As the sun goes down and takes with it the inhibitions of the daytime, you are already rocking a dark suit that can take on the nightlife. Two suits in one.",
  price: 449,
  quantity: 10
)

charcoal = Product.create!(
  category: 'suit',
  name: 'The Hustler',
  summary: 'Classic Charcoal, 100% Wool',
  description: "Bring a little flavor to your suit collection. The classic charcoal suit breaks the mold of the black and navy tradition without drawing a disapproving look from you stodgy old boss. Stay fly.",
  price: 449,
  quantity: 10
)

gray = Product.create!(
  category: 'suit',
  name: 'The Jetsetter',
  summary: 'Light Ash, 100% Wool',
  description: "This is the way to do it right here. Light gray tells people that you know what you are doing with your style game and yet can still be worn into the office in the morning. Not to mention that this suit lends itself perfectly to accouterments; use that pocket square of yours to wipe off that splash of gin and tonic that did a dance out of your glass when you flew through that patch of turbulence.",
  price: 449,
  quantity: 10
)

tuxedo = Product.create!(
  category: 'suit',
  name: 'The Tuxedo',
  summary: 'Black, 100% Wool',
  description: "No more renting one of these vintage veterans. Give it the due respect it deserves and make a spot for one in your closet. The tuxedo is the suit that has forever sat at the head of the table and watched all other suit trends jostle for a spot next to it.",
  price: 529,
  quantity: 10
)

build = Product.create!(
  category: 'suit',
  name: 'Build Your Own Suit',
  summary: 'Break The Mold',
  description: "Want to be bold with your style? Pick your suiting fabric pattern and composition and proceed to fully customize it. Want some help in making the decision? Consult our Style Experts to help you build a one-of-a-kind suit. Neck braces to treat the whiplash of envious onlookers will be sold separately.",
  price: 449,
  quantity: 10
)

puts 'Creating gift cards'
[25, 50, 100, 349, 469, 629].each do |price|
  gift_card = Product.create!(
    category: 'gift_card',
    name: "$#{price} Gift Card",
    price: price,
  )

  gift_card.product_images.create!(
    regular: "gift_cards/gift-card-#{price}.jpg",
    default: true
  )
end

puts 'Creating product images'
%w(black navy charcoal gray tuxedo build).each do |product_string|
  product = eval(product_string)
  %w(front back side detail).each do |image|
    product.product_images.create!(
      thumbnail: "products/suits/#{product_string}/#{image}-thumbnail.png",
      regular: "products/suits/#{product_string}/#{image}-regular.png",
      large: "products/suits/#{product_string}/#{image}-large.png",
      default: image == 'front'
    )
  end
end



