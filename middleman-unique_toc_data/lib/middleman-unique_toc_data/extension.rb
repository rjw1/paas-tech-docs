# Require core library
require 'middleman-core'
require_relative 'unique_identifier_generator'

# Extension namespace
class UniqueTocData < ::Middleman::Extension
  option :my_option, 'default', 'An example option'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    app.before_render do |body, path, locs, template_class |
      locs[:anchor_context] = UniqueIdentifierGenerator.new

      nil
    end
  end

  def after_configuration
    Middleman::Renderers::MiddlemanRedcarpetHTML.send :include, UniqueHeaderRenderer
  end

  module UniqueHeaderRenderer
    def header(text, level)
      puts scope

      %(<h#{level} id="a-unique-id">#{text}</h#{level}>)
    end
  end
end
