class AddCsvFileFieldToCsvs < ActiveRecord::Migration[7.0]
  def change
    add_column :csvs, :csv_file, :string
  end
end
