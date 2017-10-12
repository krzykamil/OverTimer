require 'rails_helper'

describe 'navigate' do

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
    @other_user = FactoryGirl.create(:other_user)
    @non_authorized_user = FactoryGirl.create(:non_authorized_user)
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
      post1 = FactoryGirl.build_stubbed(:post, user_id: @user.id)
      post2 = FactoryGirl.build_stubbed(:second_post, user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Rationale|stuff/)
    end

    it 'should not see other users posts ' do
      post1 = FactoryGirl.build_stubbed(:post, user_id: @user.id)
      post2 = FactoryGirl.build_stubbed(:second_post, user_id: @user.id)
      another_user_post = FactoryGirl.build_stubbed(:another_user_post, user_id: @other_user.id)
      visit posts_path
      expect(page).to have_content(/Rationale|stuff/)
      expect(page).to_not have_content(another_user_post.rationale)
    end
  end

  describe 'new' do
    it 'has a link from homepage'do
      visit new_post_path

      click_link("new_post_from_nav")
      expect(page.status_code).to eq 200
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      @post = FactoryGirl.create(:post, user_id: @user.id )
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
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

      expect(@user.posts.last.rationale).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @user = FactoryGirl.create(:user)
      login_as(@user, scope: :user)
      @post = FactoryGirl.create(:post, user_id: @user.id)

    end

    it "can be edited" do
      visit edit_post_path(@post)

      select Date.tomorrow.year, from: 'post_date_1i'
      select Date::MONTHNAMES[Date.tomorrow.month], from: 'post_date_2i'
      select Date.tomorrow.day, from: 'post_date_3i'
      fill_in 'post[rationale]', with: "Edited content"
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(@post)

      expect(current_path).to eq root_path
    end
  end
end
