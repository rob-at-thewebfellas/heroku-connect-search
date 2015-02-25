module Salesforce
  module OrganisationA

    class Contact < OrganisationA::Base

      SALUTATIONS = [ 'Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof.' ].freeze

      include Salesforce::Concerns::Contactable

      alias_attribute :mobile, :mobilephone

      validates :salutation, inclusion: { in: SALUTATIONS }, allow_blank: true

    end
  end
end
