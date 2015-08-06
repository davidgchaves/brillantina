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
end
