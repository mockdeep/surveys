class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user
      t.references :blank
      t.string :text

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :blank_id
  end
end
