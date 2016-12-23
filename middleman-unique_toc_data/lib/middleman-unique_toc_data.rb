require "middleman-core"

Middleman::Extensions.register :unique_toc_data do
  require_relative "middleman-unique_toc_data/extension"
  UniqueTocData
end
