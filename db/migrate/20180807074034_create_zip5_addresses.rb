class CreateZip5Addresses < ActiveRecord::Migration[5.2]
  def change
    create_table :zip5_addresses do |t|
      t.string :zip5
      t.string :city
      t.string :area
      t.string :road
      t.string :scope
      t.string :side
      t.integer :begin
      t.integer :end

      t.timestamps
    end
  end
end
