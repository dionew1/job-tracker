require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    Category.create!(title: "Quality")
    Category.create!(title: "Design")

    visit categories_path

    expect(page).to have_content("Quality")
    expect(page).to have_content("Design")
  end

end
