class Customization < ActiveRecord::Base
  attr_accessible :bouttoniere, :buttons, :fit, :lapel, :lining, :monogram, :pant_cuffs, :pick_stitching, :pleats, :vents, :vest_buttons
  has_many :cart_items
end
