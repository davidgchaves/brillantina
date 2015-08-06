require "rails_helper"

feature "Homepage" do
  before do
    User.create(email: 'paul@example.com', password: 'paul_at_example_dot_com')
  end

  scenario "after asking user to log in welcomes user" do
    visit "/"

    expect(page).to have_content("Log in")

    fill_in 'Email',    with: 'paul@example.com'
    fill_in 'Password', with: 'paul_at_example_dot_com'
    click_button 'Log in'

    within "h1" do
      expect(page).to have_content("Welcome to Brillantina, paul@example.com!")
    end
  end

  scenario "after asking visitors to sign up welcomes new user" do
    visit "/"
    click_link "Sign up"

    expect(page).to have_content("Sign up")

    fill_in 'Email',                 with: 'new-user@example.com'
    fill_in 'Password',              with: 'new-user-password'
    fill_in 'Password confirmation', with: 'new-user-password'
    click_button 'Sign up'

    within "h1" do
      expect(page).to have_content("Welcome to Brillantina, new-user@example.com!")
    end
  end
end
