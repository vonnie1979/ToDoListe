class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.datetime :received_at
      t.integer :priority
      t.text :description
      t.datetime :deadline_at
      t.boolean :done
      t.string :forwarded_to
      t.text :reason_of_delay
      t.datetime :new_deadline_at

      t.timestamps
    end
  end
end
