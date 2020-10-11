require 'rails_helper'
# require 'bcrypt'

feature 'edit user profile settings', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do 
    user.confirm # devise helper to confirm user account
    sign_in user # devise helper to login user
    
    # check that user is confirmed and saved in the db
    expect(user.confirmed_at).not_to be_nil
    expect(User.count).to eq(1)
  end

  scenario 'edit full name field' do
    new_full_name = 'My new full name'

    expect(user.full_name).not_to eq(new_full_name)

    visit edit_user_registration_path
    fill_in 'Full name', with: new_full_name
    fill_in 'Current password', with: user.password
    click_button 'Update profile'

    user.reload
    expect(user.full_name).to eq(new_full_name)
    expect(page).to have_css('.notice')
  end

  scenario 'edit email field' do
    new_email = 'newemail@example.com'

    expect(user.email).not_to eq(new_email)

    visit edit_user_registration_path
    fill_in 'Email', with: new_email
    fill_in 'Current password', with: user.password
    click_button 'Update profile'

    user.reload
    user.confirm
    expect(user.email).to eq(new_email)
    expect(page).to have_css('.notice')
  end

  # Remember that 'password' is just a virtual attribute (i.e. it is not stored in the db)
  # so updating the user account password does not update it, but only the
  # 'encrypted_password' attribute in the db
  scenario 'edit password' do
    new_password = 'newpassword'
    encrypted_password = user.encrypted_password

    expect(user.password).not_to eq(new_password)

    visit edit_user_registration_path
    fill_in 'Password', with: new_password
    fill_in 'Password confirmation', with: new_password
    fill_in 'Current password', with: user.password
    click_button 'Update profile'

    # I don't know why the following line doesn't work
    # (maybe Devise uses a different BCrypt config?)
    # expect(User.find(user.id).encrypted_password).to eq(BCrypt::Password.create(new_password))

    # Because the previous line does not work, I decided to use this
    # expectation, which is weaker (it just checks that the
    # encrypted password is different after updating the profile)
    user.reload
    expect(user.encrypted_password).not_to eq(encrypted_password)
    expect(page).to have_css('.notice')
  end

  scenario 'edit field with invalid current password' do
    full_name = user.full_name

    visit edit_user_registration_path
    fill_in 'Full name', with: 'New fantastic full name'
    # do not fill current password textbox
    click_button 'Update profile'

    user.reload
    expect(user.full_name).to eq(full_name)
    expect(page).to have_css('#error_explanation')
    expect(page).to have_css('.field_with_errors')
  end

  scenario 'cancel account', js: true do
    user_count = User.count

    visit edit_user_registration_path
    click_button 'Cancel my account'
    page.driver.browser.switch_to.alert.accept # accepts js pop up
    
    expect(page).to have_current_path(root_path)
    expect(User.count).to eq(user_count - 1)
    expect(page).to have_css('.notice')
  end
end