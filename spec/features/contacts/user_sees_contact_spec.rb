require 'rails_helper'

describe "User can see a contact" do
  scenario "user sees a contact for a specific company" do
    company = create(:company)
    contact = create(:contact, company: company)

    visit company_jobs_path(company)

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end
end
