module Searchable

  extend ActiveSupport::Concern
  include ThinkingSphinx::Scopes

  included do
    sphinx_scope :search_keywords do |keywords|
      [ ThinkingSphinx::Query.escape(keywords), {} ]
    end
  end

end
