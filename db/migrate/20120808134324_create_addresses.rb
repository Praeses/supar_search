class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :zip_code
      t.belongs_to :company

      t.timestamps
    end
    add_index :addresses, :company_id
  end
end
