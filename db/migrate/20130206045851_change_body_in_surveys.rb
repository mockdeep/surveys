class ChangeBodyInSurveys < ActiveRecord::Migration
  def up
    change_column :surveys, :body, :text
  end

  def down
    change_column :surveys, :body, :string
  end
end
