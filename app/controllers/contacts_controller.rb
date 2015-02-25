class ContactsController < ApplicationController

  include SearchableController

  def index
    @contacts = ThinkingSphinx.search(
      ThinkingSphinx::Query.escape(search_params[:keywords].to_s),
      classes: [ Salesforce::OrganisationA::Contact, Salesforce::OrganisationB::Contact ],
      order: :name,
      page: search_params[:page],
      per_page: Kaminari.config.default_per_page,
      star: true
    )
    respond_with(@contacts)
  end

end
