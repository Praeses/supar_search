class Company < ActiveRecord::Base
  attr_accessible :name, :number, :slogan
  has_one :address

  scope :search, ->(term) do
    where(
      self.arel_table[:name].matches("%#{term}%").
          or(self.arel_table[:number].matches("#{term}%"))
    ).joins(:address).merge(Address.search(term))
  end

  def as_json opts={}
    super({include: :address}.merge(opts))
  end
end
