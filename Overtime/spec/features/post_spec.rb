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
end
