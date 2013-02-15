puts 'Creating user jordan@tailoredrepublic.com -- don\'t forget to change password!'
User.create!(name: 'Jordan Brown', email: 'test@tailoredrepublic.com', password: 'changeme123', role: 'admin')

puts 'Creating products'
Product.create!(
  category: 'suit',
  name: 'The Executive',
  summary: 'Quintessential Black, 100% Wool',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
There is no way around it; a black suit needs to be a staple of everybody’s wardrobe. Things become classics for a
reason, because they look damn good. A properly tailored black suit will have heads nodding with respect at how well
you pulled off a classic look. Throw on a peak lapel or make it a three-piece to add a fashionable twist to your
bread and butter.
EOT
  price: 329,
  quantity: 10,
  image_large_url: 'products/suits/black-3-piece.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'suit',
  name: 'The Entrepreneur',
  summary: 'Deep Navy, 100% Wool',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
A nice deep navy is the way to go. Sport it during the day with a brown belt and shoes and really let the blue pop.
As the sun goes down and takes with it the inhibitions of the daytime, you are already rocking a dark suit that can
take on the nightlife. Two suits in one.
  EOT
  price: 329,
  quantity: 10,
  image_large_url: 'products/suits/blue-suit.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'suit',
  name: 'The Hustler',
  summary: 'Classic Charcoal, 100% Wool',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
Bring a little flavor to your suit collection. The classic charcoal suit breaks the mold of the black and navy
tradition without drawing a disapproving look from you stodgy old boss. Stay fly.
  EOT
  price: 329,
  quantity: 10,
  image_large_url: 'products/suits/charcoal-3-piece.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'suit',
  name: 'The Jetsetter',
  summary: 'Light Ash, 100% Wool',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
This is the way to do it right here. Light gray tells people that you know what you are doing with your style game
and yet can still be worn into the office in the morning. Not to mention that this suit lends itself perfectly to
accouterments; use that pocket square of yours to wipe off that splash of gin and tonic that did a dance out of your
glass when you flew through that patch of turbulence.
  EOT
  price: 329,
  quantity: 10,
  image_large_url: 'products/suits/grey-3-piece.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'suit',
  name: 'The Tuxedo',
  summary: 'Black, 100% Wool',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
No more renting one of these vintage veterans. Give it the due respect it deserves and make a spot for one in your
closet. The tuxedo is the suit that has forever sat at the head of the table and watched all other suit trends
jostle for a spot next to it.
  EOT
  price: 529,
  quantity: 10,
  image_large_url: 'products/suits/black-tuxedo.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'suit',
  name: 'Build Your Own Suit',
  summary: 'Break The Mold',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
Want to be bold with your style? Pick your suiting fabric pattern and composition and proceed to fully customize it.
Want some help in making the decision? Consult our Style Experts to help you build a one-of-a-kind suit. Neck braces
to treat the whiplash of envious onlookers will be sold separately.
  EOT
  price: 529,
  quantity: 10,
  image_large_url: 'products/suits/black-striped-suit.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'shirt',
  name: 'The White Shirt',
  summary: 'White shirt summary',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
White shirt description
  EOT
  price: 99,
  quantity: 10,
  image_large_url: 'products/shirts/white-shirt.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'shirt',
  name: 'The Blue Shirt',
  summary: 'Blue shirt summary',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
Blue shirt description
  EOT
  price: 99,
  quantity: 10,
  image_large_url: 'products/shirts/blue-shirt.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

Product.create!(
  category: 'accessory',
  name: 'The Gray Tie',
  summary: 'Gray tie summary',
  description: <<-EOT.gsub(/\n$/, '').gsub(/\n/, ' '),
Gray tie description
  EOT
  price: 49,
  quantity: 10,
  image_large_url: 'products/accessories/gray-tie.png',
  image_small_1_url: 'products/suits/modal-suit-preview.png',
  image_small_2_url: 'products/suits/modal-suit-preview.png',
  image_small_3_url: 'products/suits/modal-suit-preview.png',
  image_small_4_url: 'products/suits/modal-suit-preview.png'
)

[25, 50, 100, 349, 469, 629].each do |price|
  Product.create!(
    category: 'gift_card',
    name: "$#{price} Gift Card",
    price: price,
    image_large_url: "gift_cards/gift-card-#{price}.jpg"
  )
end

