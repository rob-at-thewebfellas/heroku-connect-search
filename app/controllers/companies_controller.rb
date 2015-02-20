class CompaniesController < ApplicationController

  def index
    @companies = Company.order(:name)
  end

end