class SearchesController < ApplicationController

  SEARCH_CLASSES = [
    Company,
    Salesforce::OrganisationA::Contact,
    Salesforce::OrganisationB::Contact
  ].freeze

  include SearchableController

  def index
    @resources = ThinkingSphinx.search(
      ThinkingSphinx::Query.escape(search_params[:keywords].to_s),
      classes: search_params[:class_names],
      order: :name,
      page: search_params[:page],
      per_page: Kaminari.config.default_per_page,
      star: true
    )

    respond_with(@resources)
  end

  protected

    def initialize_search_params
      super.tap do |s|
        s[:classes] = Array.wrap(s[:classes] || [0, 1, 2]).map(&:to_i)
        s[:class_names] = s[:classes].map { |type| SEARCH_CLASSES[type] }.delete_if(&:blank?)
      end
    end

end