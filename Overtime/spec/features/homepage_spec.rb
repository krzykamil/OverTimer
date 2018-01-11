require 'rails_helper'

describe 'Homepage' do
  let!(:admin_user) { create :admin_user }
  let!(:user) { create :user }
  # let!(:other_user) { create :other_user }
  let!(:post) { create :post, user_id: user.id }
  # let!(:second_post) { create :second_post, user_id: user.id }
  # let!(:third_post) { create :second_post, user_id: other_user.id }

  before do
    login_as(admin_user, scope: :user)
  end

  it 'allows to approve posts from homepage' do
    visit root_path
    click_on("approve_#{post.id}")
    expect(post.reload.status).to eq 'approved'
  end
end
