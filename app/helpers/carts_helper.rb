module CartsHelper
  def customization_list(line_item, show_fabric_ids = false)
    customization = line_item.customization
    if customization.product_category == 'suit'
      customizations = [
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
        fabric_key = line_item.name == 'Build Your Own Suit' ? customization.fabric : line_item.name
        customizations.unshift({ option: "Fabric", type: Customization.fabric_id(fabric_key) })
      else
        if customization.fabric?
          customizations.unshift({ option: "Fabric", type: customization.fabric.titleize })
        end
      end
      customizations
    elsif customization.product_category == 'shirt'
      [
        { option: "Collar", type: customization.collar.capitalize },
        { option: "Fit", type: customization.fit.capitalize },
        { option: "Pocket", type: wordify(customization.pant_cuffs) },
        { option: "Monogram", type: customization.monogram.length == 0 ? "None" : "#{customization.monogram} (#{customization.monogram_color}) (+$#{Product.shirt_monogram_price})" }
      ]
    end
  end

  def customization_to_key(customization)
    customization.downcase.tr(" ", "_")
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
