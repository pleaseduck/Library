class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.belongs_to :library, index: true
      t.integer :library_id
      t.string :surname, null: false, default: ''
      t.string :name, null: false, default: ''
      t.date :birthday
      t.date :employment_day
      t.string :position, null: false, default: ''
      t.string :education, null: false, default: ''

      t.timestamps
    end
  end
end
