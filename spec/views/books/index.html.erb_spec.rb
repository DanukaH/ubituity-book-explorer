require 'rails_helper'

RSpec.describe 'books/index', type: :view do
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
    assign(:books, [
             Book.create!(
               title: 'Title',
               author: 'Author',
               publisher_name: 'Publisher Name',
               date_published: Faker::Date.in_date_period,
               uuid: SecureRandom.uuid,
               csv_id: @csv.id
             ),
             Book.create!(
               title: 'Title',
               author: 'Author',
               publisher_name: 'Publisher Name',
               date_published: Faker::Date.in_date_period,
               uuid: SecureRandom.uuid,
               csv_id: @csv.id
             )
           ])
  end

  it 'renders a list of books' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Author'.to_s, count: 2
    assert_select 'tr>td', text: 'Publisher Name'.to_s, count: 2
  end
end
