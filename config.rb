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
page '/styles.html', :layout => false
page '/feed.xml', :layout => false

activate :blog do |blog|
  blog.prefix = "articles"
  blog.layout = "default"
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
  deploy.path = "/home/chadzilla/redo.chadzilla.com/"
  deploy.after_build = false
end