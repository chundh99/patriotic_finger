class DeleteBinaryDataFromCountries < ActiveRecord::Migration
  def self.up
    remove_column :countries, :binary_data
    remove_column :countries, :content_type
  end

  def self.down
  end
end
