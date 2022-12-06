json.extract! book, :id, :title, :author, :date_published, :publisher_name, :created_at, :updated_at
json.url book_url(book, format: :json)
