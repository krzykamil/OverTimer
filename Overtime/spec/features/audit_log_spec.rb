require 'rails_helper'

describe 'AuditLog Feature' do
  let!(:admin) { create :admin_user }
  let!(:audit_log) { create :audit_log }
  before do
    login_as(user, scope: :admin)
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
    xit 'cannot be accesed by non admin users' do

    end
  end
end
