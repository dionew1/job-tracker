class DashboardsController < ApplicationController
  def show
    @jobs = Job.all
  end
end
