class AddUserToCsvs < ActiveRecord::Migration[7.0]
  def change
    add_reference :csvs, :user, null: false, foreign_key: true
  end
end
