class CreateBlanks < ActiveRecord::Migration
  def change
    create_table :blanks do |t|
      t.string :name
      t.integer :survey_id

      t.timestamps
    end
    add_index :blanks, :name
    add_index :blanks, :survey_id
  end
end
