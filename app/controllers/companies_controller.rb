class CompaniesController < ApplicationController

  include SearchableController

  before_action :set_company, only: [ :show, :edit, :update, :destroy ]

  def create
    @company = Company.new(company_params)
    @company.save
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  def edit
  end

  def index
    @companies = collection_scope
    respond_with(@companies)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def show
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  private

    def collection_scope
      if search_params_present?
        apply_scopes(Company.search, search_params).search(
          order: :name,
          per_page: Company.default_per_page,
          star: true
        )
      else
        Company.order_by_name.page(search_params[:page])
      end
    end

    def company_params
      params.require(:company).permit(:name)
    end

    def set_company
      @company = Company.find(params[:id])
    end

end
