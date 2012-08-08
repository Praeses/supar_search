class Address < ActiveRecord::Base
  attr_accessible :city, :state, :zip_code
  belongs_to :company

  scope :search, ->(term) do
    where(
      self.arel_table[:city].matches("%#{term}%").
          or(self.arel_table[:state].matches("%#{term}%")).
          or(self.arel_table[:zip_code].matches("%#{term}%"))
    )
  end

  def as_json opts={}
    super({include: :company}.merge(opts))
  end
end
