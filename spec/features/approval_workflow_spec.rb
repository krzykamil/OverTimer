require 'rails_helper'

describe 'navigate' do
  let!(:admin) { create :admin_user }
  let!(:user) {create :user }
  let!(:post) { create :post, user_id: user.id }

  describe 'edit by admin' do

    it 'post has a status that can be edited on the form by an admin' do
      login_as(admin, :scope => :user)
      visit edit_post_path(post)
      choose('post_status_approved')
      click_on "Save"

      expect(post.reload.status).to eq('approved')
    end
  end

  describe 'edit by an regular user' do

    before :each do
      login_as(user, :scope => :user)
      visit edit_post_path(post)
    end

    it 'cannot be edited by non admin' do
      visit edit_post_path(post)
      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator after approval' do
      post.update(status: 'approved')
      visit edit_post_path(post)
      expect(current_path).to eq root_path
    end
  end
end
