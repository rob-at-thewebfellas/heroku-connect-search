module SearchableController

  extend ActiveSupport::Concern

  included do
    helper_method :search_params

    with_options only: :index do |o|
      o.has_scope :search_keywords, as: :keywords
      o.has_scope :page, default: 1
    end
  end

  protected

    def initialize_search_params
      (params[:q] || {}).merge(page: params[:page])
    end

    def search_params_present?
      search_params.except(:page).values.any?(&:present?)
    end

    def search_params
      @search_params ||= initialize_search_params
    end

end