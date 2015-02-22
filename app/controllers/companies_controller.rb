class CompaniesController < ApplicationController

  helper_method :search_query

  def index
    @companies = if search_query.present?
      Company.search(Riddle::Query.escape(search_query), order: :name, star: true)
    else
      Company.order(:name)
    end.page(params[:page]).per(Company.default_per_page)
  end

  protected

    def search_query
      @search_query ||= params[:query].to_s
    end

end