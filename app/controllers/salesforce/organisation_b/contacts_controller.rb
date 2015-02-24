module Salesforce
  module OrganisationB
    class ContactsController < ApplicationController

      include SearchableController

      before_action :set_contact, only: [ :show, :edit, :update, :destroy ]

      def create
        @contact = Contact.new(contact_params)
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
        @contact = Contact.new
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
            apply_scopes(Contact.search_order_by_name, search_params).search(
              per_page: Contact.default_per_page,
              star: true
            )
          else
            Contact.not_deleted.order_by_name.page(search_params[:page])
          end
        end

        def contact_params
          params.require(Contact.model_name.param_key).permit(
            :department,
            :email,
            :first_name,
            :last_name,
            :phone,
            :title
          )
        end

        def set_contact
          @contact = Contact.find(params[:id])
        end

    end
  end
end