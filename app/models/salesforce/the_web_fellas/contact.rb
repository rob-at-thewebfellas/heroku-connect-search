module Salesforce
  module TheWebFellas
    class Contact < ::Salesforce::Base

      def full_name
        [ firstname, lastname ].join(' ')
      end

    end
  end
end