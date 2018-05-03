class CreateAddIssuancesCountToBooks < ActiveRecord::Migration[5.1]
  def up
   add_column :books, :issuances_count, :integer, default: 0
   Book.reset_column_information
   Book.all.each do |c|
     Book.update_counters c.id, issuances_count: c.issuances.length
   end
 end
 def down
   remove_column :categories, :issues_count
 end
end
