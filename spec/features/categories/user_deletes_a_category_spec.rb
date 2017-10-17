require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Design")
    visit categories_path

    click_link "Delete"

    expect(page).to have_content("Design was successfully deleted!")
  end
end
