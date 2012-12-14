require 'enumerated_attribute'

class Customization < ActiveRecord::Base
  enum_attr :lapel, %w(notch peak narrow)
  enum_attr :fit, %w(slim fit tailored)
  attr_accessible :lapel, :buttons, :bouttoniere, :fit, :lining, :monogram, :pant_cuffs, :pick_stitching, :pleats,
                  :vents, :vest_buttons
  has_many :cart_items
end
