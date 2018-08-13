class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.integer :phone_number
      t.string :office_address

      t.timestamps
    end
  end
end
