require 'rails_helper'

describe "user sees a comment" do
  scenario "a user sees a comment for a specific job" do
    category = create(:category)
    company = create(:company)
    job = create(:job, category: category, company: company)

    job.comments.create!(content: "Submitted Resume")

    visit company_job_path(company, job)

    expect(page).to have_content("Submitted Resume")
  end
end
