class Inspection
  include Mongoid::Document

  field :name, type: String
  field :number, type: Integer
  field :company_id, type: Integer

  scope :search, ->(term) { any_of( {name: /#{term}/i}, {number: term}) }


  def company
    Company.find(company_id) if Company.exists?(company_id)
  end


  def company_attributes
    company.nil? ? {} : company.attributes
  end


  def as_json opts= {}
    super(opts).merge({company: company_attributes})
  end
end
