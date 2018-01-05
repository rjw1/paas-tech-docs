require 'lib/unique_identifier_generator'
require 'lib/unique_identifier_extension'
#require 'lib/tech_docs_html_renderer'

###
# Page options, layouts, aliases and proxies
###

set :markdown_engine, :redcarpet
set :markdown,
    fenced_code_blocks: true,
    tables: true,
    no_intra_emphasis: true

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :autoprefixer
activate :navtree do |options|
  options.ignore_dir = ['images', 'javascripts', 'figures', 'layouts']
  options.ignore_files = ['*.ico']
end
activate :sprockets
activate :syntax

###
# Helpers
###

helpers do
  def table_of_contents(resource)
    content = File.read(resource.source_file)
    toc_renderer = Redcarpet::Render::HTML_TOC.new
    markdown = Redcarpet::Markdown.new(toc_renderer, nesting_level: 3) # nesting_level is optional
    markdown.render(content)
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

###
# Tech Docs-specific configuration
###

config[:tech_docs] = YAML.load_file('config/tech-docs.yml')
                         .with_indifferent_access

activate :unique_identifier
