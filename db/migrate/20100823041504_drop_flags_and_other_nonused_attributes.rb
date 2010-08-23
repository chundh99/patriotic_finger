class DropFlagsAndOtherNonusedAttributes < ActiveRecord::Migration
  def self.up
    drop_table :flags
    remove_column :countries, :flag_id
  end

  def self.down
  end
end
