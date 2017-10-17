require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new(job_id: 1)
        expect(comment).to be_invalid
      end

      it "has unique content" do
        Comment.create!(content: "hi", job_id: 1)
        comment = Comment.create!(content: "hi", job_id: 1)
        expect(comment).to be_invalid
      end

      it "is invalid without job id" do
        comment = Comment.new(content: "hi")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content and job_id" do
        comment = Comment.new(content: "hi", job_id: 1)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to jobs" do
      comment = Comment.new(content: "hi", job_id: 1)
      expect(comment).to respond_to(:jobs)
    end
  end
end
