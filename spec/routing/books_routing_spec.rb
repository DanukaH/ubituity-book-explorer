require 'rails_helper'

RSpec.describe BooksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/csvs/1/books').to route_to('books#index', csv_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/csvs/1/books/new').to route_to('books#new', csv_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/csvs/1/books/1').to route_to('books#show', id: '1', csv_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/csvs/1/books/1/edit').to route_to('books#edit', id: '1', csv_id: '1')
    end


    it 'routes to #create' do
      expect(post: '/csvs/1/books').to route_to('books#create', csv_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/csvs/1/books/1').to route_to('books#update', id: '1', csv_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/csvs/1/books/1').to route_to('books#update', id: '1', csv_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/csvs/1/books/1').to route_to('books#destroy', id: '1', csv_id: '1')
    end
  end
end
