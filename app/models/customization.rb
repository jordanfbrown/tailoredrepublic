require 'enumerated_attribute'

class Customization < ActiveRecord::Base
  enum_attr :lapel, %w(notch peak narrow shawl)
  enum_attr :fit, %w(slim tailored normal)
  attr_accessible :lapel, :buttons, :fit, :lining, :monogram, :pant_cuffs, :pick_stitching, :pleats,
                  :vents, :vest, :collar, :pocket, :monogram_color, :fabric, :product_category
  has_many :line_items


  def self.fabric_id(fabric)
    case fabric
      when 'The Executive'
        'Filarte 10184.001/4'
      when 'The Entrepreneur'
        '10006.001/101'
      when 'The Hustler'
        '10005.001/30'
      when 'The Jetsetter'
        '10005.169/1'
      when 'The Tuxedo'
        'N/A'
      when 'charcoal-pinstripe'
        '10005.202/1'
      when 'granite-red'
        '10005.170/1'
      when 'stone-gray-with-blue'
        '10005.170/2'
      when 'powder-blue-pinstripe'
        '10005.005/2'
      else
        'Unknown fabric'
    end
  end

  def has_vest?
    vest > 0
  end

  def shirt_monogram?
    monogram.length > 0 && product_category == 'shirt'
  end
end
