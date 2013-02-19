module ApplicationHelper
  def title_helper(title)
    content_for :title, "Tailored Republic - #{title} | Custom Tailored Suits"
  end
end