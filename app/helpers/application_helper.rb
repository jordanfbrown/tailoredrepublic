module ApplicationHelper
  def title_helper(title)
    content_for :title, "#{title} | Tailored Republic"
  end
end