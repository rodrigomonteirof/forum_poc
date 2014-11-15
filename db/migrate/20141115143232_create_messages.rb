class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :parent_id

      t.timestamps
    end
  end
end
