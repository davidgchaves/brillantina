require "rails_helper"

feature "Homepage" do
  scenario "loads by default" do
    visit "/"

    within "h1" do
      expect(page).to have_content("Brillantina!")
    end
  end
end
