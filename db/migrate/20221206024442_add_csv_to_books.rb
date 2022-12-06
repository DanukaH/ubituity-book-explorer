class AddCsvToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :csv, null: false, foreign_key: true
  end
end
