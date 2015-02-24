module Salesforce
  class Base < ::ActiveRecord::Base

    self.pluralize_table_names = false
    self.abstract_class = true

    establish_connection ENV['HEROKUCONNECT_URL']

    private

       # Timestamps only get populated when data is received from Salesforce
       # causing problems in the interim - this allows Rails to set the initial
       # values and doesn't appear to cause sync issues
      def timestamp_attributes_for_create
        [ :createddate, :systemmodstamp ]
      end

      def timestamp_attributes_for_update
        [ :systemmodstamp ]
      end

  end
end
