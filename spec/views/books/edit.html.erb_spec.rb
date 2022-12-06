require 'rails_helper'

RSpec.describe 'books/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            first_name: 'MyString',
                            last_name: 'MyString',
                            email: 'example@example.com',
                            password: 'examplepassword'
                          ))
    @csv = assign(:csv, Csv.create!(
                          file_name: 'MyString',
                          url: 'MyString',
                          user_id: @user.id
                        ))
    @book = assign(:book, Book.create!(
                            title: 'MyString',
                            author: 'MyString',
                            publisher_name: 'MyString',
                            uuid: SecureRandom.uuid,
                            csv_id: @csv.id
                          ))
  end

  it 'renders the edit book form' do
    render

    assert_select 'form[action=?][method=?]', csv_book_path(@csv, @book), 'post' do

      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[publisher_name]'
    end
  end
end
