class AddDescriptionToAgencies < ActiveRecord::Migration[5.2]
  def change
    add_column :agencies, :description, :string
  end
end
