module CartsHelper
  def print_customizations(customization)
    customizations = [
      "#{customization.lapel.capitalize} Lapel",
      "#{wordify customization.buttons} Buttons",
      "#{wordify customization.vents} Vents",
      "#{wordify customization.pleats} Pleats",
      "#{wordify customization.pant_cuffs} Cuffs",
      "#{customization.fit.capitalize} Fit",
      "#{customization.lining} Lining",
      "Monogram: #{customization.monogram.length == 0 ? "None" : customization.monogram}",
      "#{wordify customization.bouttoniere} Bouttoniere",
      "#{wordify customization.pick_stitching} Pick Stitching"
    ]

    if customization.vest
      customizations << "Vest (#{customization.vest_buttons} Buttons)"
    end

    customizations.join ', '
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
