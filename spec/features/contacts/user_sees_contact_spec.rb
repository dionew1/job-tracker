require 'rails_helper'

describe "User can see a contact" do
  scenario "user sees a contact for a specific company" do
    company = Company.create!(name: "ESPN")
    company.contacts.create!(name: "Liz", position: "HR",
                                   email: "liz@hr.com", company: company)
    visit company_jobs_path(company)

    expect(page).to have_content("Liz")
    expect(page).to have_content("HR")
    expect(page).to have_content("liz@hr.com")
  end
end
