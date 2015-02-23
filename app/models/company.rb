class Company < ActiveRecord::Base

  include Searchable

  validates :name, presence: true

  scope :order_by_name, -> { order('LOWER(name) ASC') }

end
