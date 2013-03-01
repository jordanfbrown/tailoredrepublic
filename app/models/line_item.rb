class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization, :cart, :order, :quantity
  belongs_to :cart
  belongs_to :product
  belongs_to :customization, dependent: :destroy
  belongs_to :order

  delegate :name, :summary, :category, :default_photo, :subcategory, :fabric_id, to: :product

  def total_price
    calculate_price(true)
  end

  def unit_price
    calculate_price(false)
  end

  def calculate_price(total)
    if customization.nil?
      product.price.to_i * (total ? quantity : 1)
    else
      adders = 0
      adders += Product.vest_price if customization.vest?
      adders += Product.pick_stitching_price if customization.pick_stitching?
      adders += Product.shirt_monogram_price if shirt_monogram?
      (product.price + adders).to_i * (total ? quantity : 1)
    end
  end

  def shirt_monogram?
    customization.monogram.length > 0 && category == 'shirt'
  end

  def customization_array(show_fabric_ids = false)
    if category == :suit
      array = [
        { option: "Lapel", type: customization.lapel.capitalize },
        { option: "Buttons", type: wordify(customization.buttons) },
        { option: "Vents", type: wordify(customization.vents) },
        { option: "Pleats", type: wordify(customization.pleats) },
        { option: "Pant Cuffs", type: wordify(customization.pant_cuffs) },
        { option: "Fit", type: customization.fit.capitalize },
        { option: "Lining", type: customization.lining.titleize },
        { option: "Pick Stitching", type:
          (customization.pick_stitching? ? "Yes (+$#{Product.pick_stitching_price})" : 'No' ) },
        { option: "Vest", type:
          (customization.has_vest? ? "Yes, #{customization.vest} Button Vest (+$#{Product.vest_price})" : "No") }
      ]
      if show_fabric_ids
        fabric = subcategory == 'custom-fabric' ? Customization.fabric_id(customization.fabric) : fabric_id
        array.unshift({ option: "Fabric", type: fabric })
      else
        if customization.fabric?
          array.unshift({ option: "Fabric", type: customization.fabric.titleize })
        end
      end
      array
    elsif category == :shirt
      array = [
        { option: "Collar", type: customization.collar.capitalize },
        { option: "Fit", type: customization.fit.capitalize },
        { option: "Pocket", type: wordify(customization.pocket) },
        { option: "Monogram", type: customization.monogram.length == 0 ? "None" : "#{customization.monogram} (+$#{Product.shirt_monogram_price})" }
      ]
      if show_fabric_ids
        array.unshift({ option: "Fabric", type: fabric_id })
      end
      array
    end
  end

  def wordify(number)
    if number.is_a? Integer
      if number == 0
        "No"
      else
        number.to_words.capitalize
      end
    else
      number ? "Yes" : "No"
    end
  end
end
