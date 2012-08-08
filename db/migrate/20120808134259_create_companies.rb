class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :number
      t.string :slogan

      t.timestamps
    end
  end
end
