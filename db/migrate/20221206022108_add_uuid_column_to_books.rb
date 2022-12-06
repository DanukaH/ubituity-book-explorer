class AddUuidColumnToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :uuid, :binary, limit: 16
  end
end
