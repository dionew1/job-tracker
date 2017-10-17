class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_company

  def index
    @jobs = @company.jobs
  end

  def new
    @category = Category.all
    @job = Job.new()
  end

  def create
    @category = Category.all
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @category = Category.all
  end

  def update
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job.destroy

    flash[:success] = "#{@job.title} at #{@job.company.name} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  private

    def job_params
      params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
    end

    def set_job
      @job = Job.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end
end
