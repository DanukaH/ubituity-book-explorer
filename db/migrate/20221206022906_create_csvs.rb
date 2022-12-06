class CreateCsvs < ActiveRecord::Migration[7.0]
  def change
    create_table :csvs do |t|
      t.string :file_name
      t.text :url

      t.timestamps
    end
  end
end
