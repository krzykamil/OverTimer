require 'rails_helper'

describe 'AuditLog Feature' do
  let!(:admin_user) { create :admin_user }
  let!(:audit_log) { create :audit_log }
  let!(:user) { create :user }
  before do
    login_as(admin_user, scope: :user)
  end
  describe 'index' do
    it 'has and indx page' do
      visit audit_logs_path
      expect(page.status_code).to eq 200
    end
    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/DOE/)
    end
    it 'cannot be accesed by non admin users' do
      logout(admin_user)
      login_as(user, scope: :user)
      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
