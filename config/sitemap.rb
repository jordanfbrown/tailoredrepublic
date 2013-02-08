# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.tailoredrepublic.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
     add measurements_path, :priority => 0.7, :changefreq => 'weekly'
     add faq_path, :priority => 0.7, :changefreq => 'weekly'
     add schedule_tailoring_path, :priority => 0.7, :changefreq => 'weekly'
     add get_tailored_path, :priority => 0.7, :changefreq => 'weekly'
     add gift_cards_path, :priority => 0.7, :changefreq => 'weekly'
     add home_path, :priority => 0.7, :changefreq => 'weekly'
     add press_path, :priority => 0.7, :changefreq => 'weekly'
     add team_path, :priority => 0.7, :changefreq => 'weekly'
     add weddings_path, :priority => 0.7, :changefreq => 'weekly'
     add process_path, :priority => 0.7, :changefreq => 'weekly'
     add top_picks_path, :priority => 0.7, :changefreq => 'weekly'
     add about_path, :priority => 0.7, :changefreq => 'weekly'
     add lookbook_path, :priority => 0.7, :changefreq => 'weekly'
     add weddings_path, :priority => 0.7, :changefreq => 'weekly'
     add '/shop/suits', :priority => 0.7, :changefreq => 'weekly'
     add '/shop/shirts', :priority => 0.7, :changefreq => 'weekly'
     add '/shop/accessories', :priority => 0.7, :changefreq => 'weekly'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
