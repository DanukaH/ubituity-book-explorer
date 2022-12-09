class CsvImportBooksService
  # Method call will extract data from each row and create books
  def call(file, csv_id)
    csv = CSV.parse(File.open(file), headers: true, col_sep: ',')
    csv.each do |row|
      book_hash = {}
      book_hash[:title] = row['Book title']
      book_hash[:author] = row['Book author']
      book_hash[:date_published] = row['Date published']
      book_hash[:uuid] = row['Unique identifier for the book']
      book_hash[:publisher_name] = row['Publisher name']
      book_hash[:csv_id] = csv_id
      Book.create(book_hash)
    end
  end
end
