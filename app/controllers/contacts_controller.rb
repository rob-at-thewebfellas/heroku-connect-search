class ContactsController < ApplicationController

  include SearchableController

  before_action :set_contact, only: [ :show, :edit, :update, :destroy ]

  def create
    @contact = Salesforce::TheWebFellas::Contact.new(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  def edit
  end

  def index
    @contacts = collection_scope
    respond_with(@contacts)
  end

  def new
    @contact = Salesforce::TheWebFellas::Contact.new
    respond_with(@contact)
  end

  def show
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact)
  end

  private

    def collection_scope
      if search_params_present?
        apply_scopes(Salesforce::TheWebFellas::Contact.search, search_params).search(
          order: :lastname,
          per_page: Salesforce::TheWebFellas::Contact.default_per_page,
          star: true
        )
      else
        Salesforce::TheWebFellas::Contact.where(isdeleted: false).order_by_last_name.page(search_params[:page])
      end
    end

    def contact_params
      params.require(:contact).permit(
        :email,
        :first_name,
        :last_name,
        :mobile,
        :salutation,
        :title
      )
    end

    def set_contact
      @contact = Salesforce::TheWebFellas::Contact.find(params[:id])
    end

end