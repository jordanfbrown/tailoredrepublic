require 'enumerated_attribute'

class Customization < ActiveRecord::Base
  enum_attr :lapel, %w(notch peak narrow shawl)
  enum_attr :fit, %w(slim tailored normal)
  attr_accessible :lapel, :buttons, :fit, :lining, :monogram, :pant_cuffs, :pick_stitching, :pleats,
                  :vents, :vest, :collar, :pocket, :monogram_color, :fabric
  has_many :line_items


  def self.fabric_id(fabric_slug)
    fabric = CUSTOMIZATIONS['suit']['custom-fabric'][0]['options'][fabric_slug]
    if fabric.nil?
      'Unknown fabric'
    else
      fabric['id']
    end
  end

  def has_vest?
    vest > 0
  end
end
