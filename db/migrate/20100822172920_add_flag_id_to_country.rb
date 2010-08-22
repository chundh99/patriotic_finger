class AddFlagIdToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :flag_id, :integer
  end

  def self.down
    remove_column :countries, :flag_id
  end
end
