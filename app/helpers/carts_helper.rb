module CartsHelper
  def customization_to_key(customization)
    customization.downcase.tr(" ", "_")
  end
end
