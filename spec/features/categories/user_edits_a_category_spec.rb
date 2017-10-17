require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Design")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Quality"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Quality")
    expect(page).to_not have_content("Design")
  end
end
