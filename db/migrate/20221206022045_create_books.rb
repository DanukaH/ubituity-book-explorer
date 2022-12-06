class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :date_published
      t.string :publisher_name

      t.timestamps
    end
  end
end
