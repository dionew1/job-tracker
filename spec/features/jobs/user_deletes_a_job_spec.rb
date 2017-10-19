require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    category = create(:category)
    company = create(:company)
    job = create(:job, category: category, company: company)

    visit company_job_path(company, job)

    click_on "Delete"

    expect(page).to have_content("#{job.title} at #{company.name} was successfully deleted!")
  end
end
