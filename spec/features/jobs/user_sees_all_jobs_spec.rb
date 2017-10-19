require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    category = create(:category)
    company = create(:company)
    jobs = create_list(:job, 2, category: category, company: company)

    visit company_path(company)

    expect(page).to have_content(jobs[0].title)
    expect(page).to have_content(jobs[1].title)
  end
end
