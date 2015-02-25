module Salesforce
  module OrganisationB

    class Contact < OrganisationB::Base

      include Salesforce::Concerns::Contactable

    end
  end
end
