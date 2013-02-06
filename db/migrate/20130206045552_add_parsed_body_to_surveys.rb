class AddParsedBodyToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :parsed_body, :text
  end
end
