require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/books', type: :request do

  context 'when signed in as a user' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:csv) { FactoryBot.create(:csv, user:) }
    before(:each) do
      sign_in user
    end
    # Book. As you add validations to Book, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      { title: Faker::Book.title,
        author: Faker::Book.author,
        date_published: Faker::Date.in_date_period,
        publisher_name: Faker::Book.publisher,
        uuid: SecureRandom.uuid,
        csv_id: csv.id }
    end

    let(:invalid_attributes) do
      { title: nil,
        author: nil,
        date_published: nil,
        publisher_name: nil,
        uuid: nil }
    end

    describe 'GET /index' do
      it 'renders a successful response' do
        Book.create! valid_attributes
        get csv_books_url(csv)
        expect(response).to be_successful
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        book = Book.create! valid_attributes
        get csv_book_url(csv, book)
        expect(response).to be_successful
      end
    end

    describe 'GET /new' do
      it 'renders a successful response' do
        get new_csv_book_url(csv)
        expect(response).to be_successful
      end
    end

    describe 'GET /edit' do
      it 'render a successful response' do
        book = Book.create! valid_attributes
        get edit_csv_book_url(csv, book)
        expect(response).to be_successful
      end
    end

    xdescribe 'POST /create' do
      context 'with valid parameters' do
        it 'creates a new Book' do
          expect do
            post csv_books_path(csv), params: { book: valid_attributes }
          end.to change(Book, :count).by(1)
        end

        it 'redirects to the created book' do
          post csv_books_path(csv), params: { book: valid_attributes }
          expect(response).to redirect_to(csv_book_url(csv, Book.last))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new Book' do
          expect do
            post csv_books_url(csv), params: { book: invalid_attributes }
          end.to change(Book, :count).by(0)
        end
      end
    end

    describe 'PATCH /update' do
      context 'with valid parameters' do
        let(:new_attributes) do
          { title: Faker::Book.title,
            author: Faker::Book.author,
            date_published: Faker::Date.in_date_period,
            publisher_name: Faker::Book.publisher }
        end

        it 'updates the requested book' do
          book = Book.create! valid_attributes
          patch csv_book_url(csv, book), params: { book: new_attributes }
          book.reload
          expect(response).to redirect_to(csv_book_url(csv, book))
        end

        it 'redirects to the book' do
          book = Book.create! valid_attributes
          patch csv_book_url(csv, book), params: { book: new_attributes }
          book.reload
          expect(response).to redirect_to(csv_book_url(csv, book))
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested book' do
        book = Book.create! valid_attributes
        expect do
          delete csv_book_url(csv, book)
        end.to change(Book, :count).by(-1)
      end

      it 'redirects to the books list' do
        book = Book.create! valid_attributes
        delete csv_book_url(csv, book)
        expect(response).to redirect_to(csv_books_url(csv))
      end
    end
  end
end
