require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comment" do
    category = create(:category)
    company = create(:company)
    job = create(:job, category: category, company: company)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Submitted Resume"

    click_on "Submit"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Submitted Resume")
  end
end
