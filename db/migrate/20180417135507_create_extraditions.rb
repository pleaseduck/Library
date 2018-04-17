class CreateExtraditions < ActiveRecord::Migration[5.1]
  def change
    create_table :extraditions do |t|
      t.belongs_to :books, index: true
      t.belongs_to :subscribers, index: true
      t.datetime :extradition_date
    end
  end
end
