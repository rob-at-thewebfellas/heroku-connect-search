class ContactsController < ApplicationController

  helper_method :search_query

  def index
    @contacts = if search_query.present?
      Salesforce::TheWebFellas::Contact.search(Riddle::Query.escape(search_query), order: :lastname, star: true)
    else
      Salesforce::TheWebFellas::Contact.where(isdeleted: false).order(:lastname)
    end.page(params[:page]).per(Salesforce::TheWebFellas::Contact.default_per_page)
  end

  protected

    def search_query
      @search_query ||= params[:query].to_s
    end

end