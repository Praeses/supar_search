class Company < ActiveRecord::Base
  attr_accessible :name, :number, :slogan
  has_one :address
end
