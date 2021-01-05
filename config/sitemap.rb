# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://cafe.sleepinglion.pe.kr"
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

  #add users_path, :priority => 0.9

  #User.find_each do |user|
  #  add user_path(user), :lastmod => user.updated_at
  #end

  #add proposes_path, :changefreq => 'monthly'
  #add models_path, :changefreq => 'monthly'
end
