require 'enumerated_attribute'

class Customization < ActiveRecord::Base
  enum_attr :lapel, %w(notch peak narrow)
  enum_attr :fit, %w(slim tailored normal)
  attr_accessible :lapel, :buttons, :bouttoniere, :fit, :lining, :monogram, :pant_cuffs, :pick_stitching, :pleats,
                  :vents, :vest_buttons, :vest, :collar, :pocket, :monogram_color, :fabric, :product_category
  has_many :line_items
end
