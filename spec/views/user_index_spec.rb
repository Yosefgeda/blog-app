require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  describe 'Viewing user index page' do
    before(:each) do
      @user1 = User.create(name: 'Lilly', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'Teacher from Poland.', posts_counter: 1)
      @user2 = User.create(name: 'Tom', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'Teacher from India.', posts_counter: 1)
      @user3 = User.create(name: 'Yosef Geda', photo: 'https://icons.iconarchive.com/icons/iconsmind/outline/256/User-icon.png',
                           bio: 'Teacher from Ethiopia.', posts_counter: 1)
    end

    it 'should show list of all users' do
      visit users_path

      # Verify the display of names
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
    end
    it 'should show photo of all users' do
      visit users_path
      # # Verify the display of profile pictures
      expect(page.html).to include(@user1.photo)
      expect(page.html).to include(@user2.photo)
    end

    it 'should show posts_counter of all users' do
      visit users_path
      # Verify the display of the number of postss
      expect(page.html).to have_content(@user1.posts_counter)
      expect(page.html).to have_content(@user2.posts_counter)
    end

    it 'should navigate to user show page when a user is clicked' do
      visit users_path

      # Click on the user link
      click_link @user1.name

      # Verify redirection to the user's show page
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
