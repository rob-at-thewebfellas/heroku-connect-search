module Salesforce
  module OrganisationB

    class Contact < OrganisationB::Base

      include Searchable
      sphinx_scope(:search_order_by_name) { { order: :name } }

      scope :not_deleted, -> { where(isdeleted: false) }
      scope :order_by_name, -> { order('LOWER(lastname) ASC, LOWER(firstname) ASC') }

      # Make connect field names feel more 'Railsy'
      alias_attribute :first_name, :firstname
      alias_attribute :last_name, :lastname

      validates :first_name, :last_name, presence: true

    end
  end
end
