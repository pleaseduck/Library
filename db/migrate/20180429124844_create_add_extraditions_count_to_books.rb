class CreateAddExtraditionsCountToBooks < ActiveRecord::Migration[5.1]
  def up
   add_column :books, :extraditions_count, :integer, default: 0
   Book.reset_column_information
   Book.all.each do |c|
     Book.update_counters c.id, extraditions_count: c.extraditions.length
   end
 end
 def down
   remove_column :categories, :issues_count
 end
end
