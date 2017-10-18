require 'rails_helper'

describe "user can create a contact" do
  scenario "a user can create a contact for a specific company" do
    company = Company.create!(name: "ESPN")

    visit company_jobs_path(company)

    fill_in "contact[name]", with: "Liz"
    fill_in "contact[position]", with: "HR"
    fill_in "contact[email]", with: "liz@hr.com"

    click_on "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Liz")
    expect(page).to have_content("HR")
    expect(page).to have_content("liz@hr.com")
  end
end
