class Address < ActiveRecord::Base
  attr_accessible :city, :state, :zip_code
  belongs_to :company
end
