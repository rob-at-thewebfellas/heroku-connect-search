module Salesforce
  module TheWebFellas

    # Allows model to be used without it's namespace (for route helpers, etc)
    def self.use_relative_model_naming?
      true
    end

    class Contact < ::Salesforce::Base

      SALUTATIONS = [ 'Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.' ].freeze

      include Searchable
      sphinx_scope(:search_order_by_name) { { order: 'last_name ASC, first_name ASC' } }

      scope :not_deleted, -> { where(isdeleted: false) }
      scope :order_by_name, -> { order('LOWER(lastname) ASC, LOWER(firstname) ASC') }

      # Make connect field names feel more 'Railsy'
      alias_attribute :first_name, :firstname
      alias_attribute :last_name, :lastname
      alias_attribute :mobile, :mobilephone
      alias_attribute :created_at, :createddate
      alias_attribute :updated_at, :systemmodstamp

      validates :first_name, :last_name, presence: true

    end
  end
end
