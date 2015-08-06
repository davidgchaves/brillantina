require "rails_helper"

feature "Homepage" do
  before do
    User.create email: 'paul@example.com', password: 'paul_at_example_dot_com'
  end

  scenario "after asking user to log in welcomes user" do
    visit_homepage

    expect(page).to have_content "Log in"

    sign_in_with 'paul@example.com', 'paul_at_example_dot_com'

    expect_welcome_message_for 'paul@example.com'
  end

  scenario "after asking visitors to sign up welcomes new user" do
    visit_homepage
    click_link "Sign up"

    expect(page).to have_content "Sign up"

    sign_up_with 'new-user@example.com', 'new-user-password'

    expect_welcome_message_for 'new-user@example.com'
  end

  private
    def visit_homepage
      visit "/"
    end

    def sign_in_with(email, password)
      fill_in 'Email',    with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def sign_up_with(email, password)
      fill_in 'Email',                 with: 'new-user@example.com'
      fill_in 'Password',              with: 'new-user-password'
      fill_in 'Password confirmation', with: 'new-user-password'
      click_button 'Sign up'
    end

    def expect_welcome_message_for(email)
      within "h1" do
        expect(page).to have_content "Welcome to Brillantina, #{email}!"
      end
    end
end
