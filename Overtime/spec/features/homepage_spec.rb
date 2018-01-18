require 'rails_helper'

describe 'Homepage' do
  let(:admin_user) { create :admin_user }
  let(:user)       { create :user }

  context 'Admin homepage' do
    before { login_as(admin_user, scope: :user) }
    let!(:post) { create :post, user_id: user.id }
    it 'allows admin to approve posts' do
      visit root_path
      click_on("approve_#{post.id}")
      expect(post.reload.status).to eq 'approved'
    end
  end

  context 'Employee homepage' do
    before { login_as(user, scope: :user) }
    let(:audit_log) { create :audit_log, user_id: user.id }
    it 'allows employee to change audit logs status' do
      login_as(user, scope: :user)
      visit root_path
      click_on("confirm_#{audit_log.id}")
      expect().to eq ''
    end
  end
end
