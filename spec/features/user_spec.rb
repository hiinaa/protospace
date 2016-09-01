require 'rails_helper'

RSpec.feature 'user', type: :feature do
  given(:user) { build(:user) }
  given(:login_user) { create(:user) }
  given(:prototype) { build(:prototype) }

  scenario 'user sign_up' do
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'user_nickname', with: user.nickname
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Save'
  end

  scenario 'create a new prototype', js: true do
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'user_nickname', with: user.nickname
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Save'
    # sign_in
    click_on 'New Proto'
    fill_in 'prototype_title', with: prototype.title
    attach_file 'prototype[prototype_images_attributes][0][image]', "spec/fixtures/sample.jpg", visible: false
    fill_in 'prototype_catch_copy', with: prototype.catch_copy
    fill_in 'prototype_concept', with: prototype.concept
    click_on 'Publish'
    expect(page).to have_content 'Created successfully!'
  end
end
