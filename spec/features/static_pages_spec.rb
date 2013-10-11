require 'spec_helper'

feature "Home page" do
  scenario "should have the content 'PolitiQA'" do
    visit '/static_pages/home'
    expect(page).to have_content('PolitiQA')
  end
end

feature "About page" do
  scenario "should have the content 'A propos'" do
    visit '/static_pages/about'
    expect(page).to have_content('A propos')
  end
end
