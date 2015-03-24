class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :details
      t.datetime :date_and_time

      t.references :group

      t.timestamps
    end
    add_index :events, :group_id
  end
end
