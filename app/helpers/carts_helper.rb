module CartsHelper
  def customization_list(customization)
    [
      { option: "Lapel", type: customization.lapel.capitalize },
      { option: "Buttons", type: wordify(customization.buttons) },
      { option: "Vents", type: wordify(customization.vents) },
      { option: "Pleats", type: wordify(customization.pleats) },
      { option: "Pant Cuffs", type: wordify(customization.pant_cuffs) },
      { option: "Fit", type: customization.fit.capitalize },
      { option: "Lining", type: customization.lining },
      { option: "Monogram", type: customization.monogram.length == 0 ? "None" : customization.monogram },
      { option: "Bouttoniere", type: wordify(customization.bouttoniere) },
      { option: "Pick Stitching", type: wordify(customization.pick_stitching) },
      { option: "Vest", type:
        (customization.vest ? "#{customization.vest_buttons} Button Vest (+$#{Product.vest_price})" : "No") }
    ]
  end

  def customization_to_key(customization)
    if customization == "Pick Stitching" || customization == "Bouttoniere"
      "advanced"
    else
      customization.downcase.tr(" ", "_")
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
