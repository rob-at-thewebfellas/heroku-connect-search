class SearchesController < ApplicationController

  include SearchableController

  def index
    @resources = ThinkingSphinx.search(
      ThinkingSphinx::Query.escape(search_params[:keywords].to_s),
      page: search_params[:page],
      per_page: Kaminari.config.default_per_page,
      star: true
    )

    respond_with(@resources)
  end

end