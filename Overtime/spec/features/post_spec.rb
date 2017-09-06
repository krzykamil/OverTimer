require 'rails_helper'

describe 'navigate' do
  describe 'index' do #TODO differantee view for admin and user
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq 200
    end

    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: "JoeDoe@gmail.com", password: "Ilovemywife", password_confirmation: "Ilovemywife", first_name: "Joe", last_name: "Doe")
      login_as(user, scope: :user)
      visit new_post_path
    end

    it 'has a new form taht can be reached' do

      expect(page.status_code).to eq 200
    end

    it 'can be created from new form page' do
      #
      select Date.today.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.today.month], from: 'post_date_2i'
      select Date.today.day, from: 'post_date_3i'
      fill_in 'post[rationale]', with: "Some content"

      click_on "Save"

      expect(page).to have_content("Some content")
    end

    it 'will have user associated with' do
      select Date.today.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.today.month], from: 'post_date_2i'
      select Date.today.day, from: 'post_date_3i'
      fill_in 'post[rationale]', with: "User Association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
