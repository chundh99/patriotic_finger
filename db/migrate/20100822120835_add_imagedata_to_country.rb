class AddImagedataToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :content_type, :string
    add_column :countries, :filename, :string
    add_column :countries, :binary_data, :binary
  end

  def self.down
    remove_column :countries, :binary_data
    remove_column :countries, :filename
    remove_column :countries, :content_type
  end
end
