class ContactsController < ApplicationController

  helper_method :search_query

  def index
    @contacts = if search_query.present?
      Salesforce::TheWebFellas::Contact.search(Riddle::Query.escape(search_query), order: :lastname, star: true)
    else
      Salesforce::TheWebFellas::Contact.order(:lastname)
    end.page(params[:page])
  end

  protected

    def search_query
      @search_query ||= params[:query].to_s
    end

end