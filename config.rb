require 'slim'
set :slim, :pretty => true

# primary asset paths
set :source, "source"
set :css_dir, "assets/css"
set :js_dir, "assets/js"
set :images_dir, "assets/img"
set :fonts_dir, "assets/fonts"
set :layouts_dir, "layouts"
set :layout, "default"
#set :build_dir, "build"
# core/main pages
page '/', :layout => 'default'
page '/old-index.html', :layout => false
page '/contact.html', :layout => 'default'
# random section
page '/random/index.html', :layout => 'random-index'
# articles section
page '/articles', :layout => 'article'
page '/articles/*', :layout => 'article'
# travel folder
page '/travel/maps/index.html', :layout => false
page '/travel/maps/*.json', :layout => false
# files/pages to ignore
page '/page.php', :layout => false



page '/feed.xml', :layout => false

activate :blog do |blog|
  blog.prefix = "random"
  blog.layout = "random"
  blog.tag_template = "templates/tag.html"
  blog.calendar_template = "templates/calendar.html"
end


# markdown options
set :markdown, :tables => true, :autolink => true, :fenced_code_blocks => true

# turn off SASS line comments
::Compass.configuration.sass_options = { :line_comments => false }

activate :livereload
activate :directory_indexes

# Build config
configure :build do
  activate :relative_assets
  activate :minify_css
  activate :minify_javascript
  # activate :asset_hash #cachebuster
end

# Deploy config
activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "chadzilla"
  deploy.host = "chadzilla.com"
  #deploy.path = "/home/chadzilla/redo.chadzilla.com/"
  deploy.path = "/home/chadzilla/chadzilla.com/"
  deploy.clean = false
end