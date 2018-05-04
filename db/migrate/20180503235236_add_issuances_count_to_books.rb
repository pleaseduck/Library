class AddIssuancesCountToBooks < ActiveRecord::Migration[5.1]
  def self.up
    add_column :books, :issuances_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :books, :issuances_count
  end
end
