class Csv < ApplicationRecord
  belongs_to :user
  has_many :books
  mount_uploader :csv_file, CsvFileUploader

  def self.rename_file(original_filename)
    filename_arr = original_filename.split('.')
    "#{filename_arr[0]}_#{SecureRandom.uuid}.#{filename_arr[1]}"
  end
end
