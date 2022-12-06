
require 'rails_helper'

describe Book do

  let!(:user) { FactoryBot.create(:user) }
  let!(:csv) { FactoryBot.create(:csv, user:) }

  describe 'factory' do
    let!(:book) { FactoryBot.build(:book, csv:) }

    it 'produces a valid object' do
      expect(book).to be_valid
    end
  end

  describe 'on create callback' do
    it 'creates the book' do
      new_book = Book.create(title: Faker::Book.title, author: Faker::Book.author, date_published: Faker::Date.in_date_period,
                             publisher_name: Faker::Book.publisher, uuid: SecureRandom.uuid, csv_id: csv.id)
      expect(new_book).to be_valid
    end
  end

  describe 'validations' do
    context 'without title' do
      let!(:book) { FactoryBot.build(:book) }
      it 'is invalid' do
        book.title = nil
        expect(book).not_to be_valid
      end
    end
  end

  describe 'validations' do
    context 'without title' do
      let!(:book) { FactoryBot.build(:book) }
      it 'is invalid' do
        book.uuid = nil
        expect(book).not_to be_valid
      end
    end
  end
end
