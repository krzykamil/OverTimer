require 'rails_helper'

describe 'navigate' do

  let!(:user) { create :user }
  let!(:other_user) { create :other_user }
  let!(:admin_user) { create :admin_user }
  let!(:non_authorized_user) { create :non_authorized_user }
  let!(:post) { create :post, user_id: user.id }
  let!(:second_post) { create :second_post, user_id: user.id }
  let!(:another_user_post) { create :another_user_post, user_id: other_user.id }

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do

    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq 200
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      visit posts_path
      expect(page).to have_content(/work_performed|stuff/)
    end

    it 'should not see other users posts ' do
      visit posts_path
      expect(page).to have_content(/work_performed|stuff/)
      expect(page).to_not have_content(another_user_post.work_performed)
    end
  end

  describe 'new' do
    let!(:user) { Employee.create(email: 'heheh@mo.pl') }
    before do
      login_as(user, scope: :user)
    end
    it 'has a link from homepage'do
      visit new_post_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq 200
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path

      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq 200
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq 200
    end

    it 'can be created from new form page' do
      #TODO find a better way to deal with datepicker test
      select Date.today.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.today.month], from: 'post_date_2i'
      select Date.today.day, from: 'post_date_3i'
      fill_in 'post[work_performed]', with: "Some content"
      fill_in 'post[daily_hours]', with: 4.5

      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have user associated with' do
      select Date.today.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.today.month], from: 'post_date_2i'
      select Date.today.day, from: 'post_date_3i'
      fill_in 'post[work_performed]', with: "User Association"
      fill_in 'post[daily_hours]', with: 4.5

      click_on "Save"

      expect(user.posts.last.work_performed).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      login_as(user, scope: :user)
    end

    it "can be edited" do
      visit edit_post_path(post)

      select Date.tomorrow.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.tomorrow.month], from: 'post_date_2i'
      select Date.tomorrow.day, from: 'post_date_3i'
      fill_in 'post[work_performed]', with: "Edited content"
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(post)

      expect(current_path).to eq root_path
    end
  end
end
