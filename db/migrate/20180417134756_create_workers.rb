class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.belongs_to :library, index: true
      t.string :surname, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :position, null: false, default: ''

      t.timestamps
    end
  end
end
