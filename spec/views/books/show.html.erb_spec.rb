require 'rails_helper'

RSpec.describe 'books/show', type: :view do
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
                            title: 'Title',
                            author: 'Author',
                            publisher_name: 'Publisher Name',
                            date_published: Faker::Date.in_date_period,
                            uuid: SecureRandom.uuid,
                            csv_id: @csv.id
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Publisher Name/)
  end
end
