module Salesforce
  module OrganisationB
    class Base < ::Salesforce::Base
      self.abstract_class = true
      self.table_name_prefix = 'organisation_b.'
    end
  end
end
