require 'middleman-core/renderers/redcarpet'
require_relative 'unique_identifier_generator'

class TechDocsHTMLRenderer < Middleman::Renderers::MiddlemanRedcarpetHTML
  include Redcarpet::Render::SmartyPants

  def image(link, *args)
    %(<a href="#{link}" target="_blank" rel="noopener noreferrer">#{super}</a>)
  end

  def table(header, body)
    %(<div class="table-container">
      <table>
        #{header}#{body}
      </table>
    </div>)
  end

  def header(text, level)
    anchor = anchor_generator.create(text, level)

    %(<h#{level} id="#{anchor}">#{text}</h#{level}>)
  end

  def anchor_generator
    scope.current_resource.data[:anchor_generator] ||= UniqueIdentifierGenerator.new
  end
  
end
