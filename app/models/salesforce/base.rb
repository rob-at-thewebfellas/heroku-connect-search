module Salesforce
  class Base < ::ActiveRecord::Base
    cattr_accessor :schema_name
    self.schema_name = ENV['HEROKUCONNECT_SCHEMA'] || 'public'

    self.pluralize_table_names = false
    self.table_name_prefix = self.schema_name + '.'

    self.abstract_class = true
    establish_connection ENV['HEROKUCONNECT_URL']
  end
end
