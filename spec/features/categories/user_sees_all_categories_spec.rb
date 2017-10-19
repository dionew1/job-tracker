require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content(category[0].title)
    expect(page).to have_content(category[1].title)
  end

end
