class LineItem < ActiveRecord::Base
  attr_accessible :product, :customization, :quantity
  belongs_to :cart
  belongs_to :product
  belongs_to :customization, dependent: :destroy
  belongs_to :order

  delegate :name, :summary, :category, :default_photo, :subcategory, :fabric_id, to: :product

  def self.sum_price(line_items)
    line_items.map { |l| l.total_price }.sum.to_i
  end

  def self.only_accessories?(line_items)
    LineItem.only_category?(line_items, :accessory)
  end

  def self.only_shirts?(line_items)
    LineItem.only_category?(line_items, :shirt)
  end

  def self.only_category?(line_items, category)
    line_items.length > 0 && line_items.all? { |l| l.category == category }
  end

  def total_price
    # Include quantity
    calculate_price(true)
  end

  def unit_price
    # Don't include quantity
    calculate_price(false)
  end

  def calculate_price(include_quantity)
    if customization.nil?
      product.price.to_i * (include_quantity ? quantity : 1)
    else
      adders = 0
      adders += Product.vest_price if customization.vest?
      adders += Product.pick_stitching_price if customization.pick_stitching?
      adders += Product.shirt_monogram_price if shirt_monogram?
      (product.price + adders).to_i * (include_quantity ? quantity : 1)
    end
  end

  def shirt_monogram?
    customization.monogram.length > 0 && category == :shirt
  end

  def final_fabric
    subcategory == 'custom-fabric' ? Customization.fabric_id(customization.fabric) : fabric_id
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
          (customization.has_vest? ? "Yes, #{customization.vest} Button Vest (+$#{Product.vest_price})" : "No") },
        { option: "Monogram", type: customization.monogram.length == 0 ? "None" : "#{customization.monogram} (#{customization.monogram_color})" }
      ]
      if show_fabric_ids
        array.unshift({ option: "Fabric", type: final_fabric })
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
