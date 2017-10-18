require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        category = Category.create!(title: "Consulting")
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                    city: "Denver", category: category)

        comment = Comment.new(job: job)
        expect(comment).to be_invalid
      end

      it "has unique content" do
        category = Category.create!(title: "Consulting")
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                    city: "Denver", category: category)

        Comment.create(content: "hi", job: job)
        comment = Comment.create(content: "hi", job: job)
        expect(comment).to be_invalid
      end

      it "is invalid without job id" do
        comment = Comment.new(content: "hi")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content and job_id" do
        category = Category.create!(title: "Consulting")
        company = Company.create!(name: "ESPN")
        job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                    city: "Denver", category: category)

        comment = Comment.new(content: "hi", job: job)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to jobs" do
      category = Category.create!(title: "Consulting")
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70,
                                  city: "Denver", category: category)

      comment = Comment.create!(content: "hi", job: job)
      expect(comment).to respond_to(:job)
    end
  end
end
