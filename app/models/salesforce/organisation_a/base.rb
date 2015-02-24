module Salesforce
  module OrganisationA
    class Base < ::Salesforce::Base
      self.abstract_class = true
      self.table_name_prefix = 'organisation_a.'
    end
  end
end
