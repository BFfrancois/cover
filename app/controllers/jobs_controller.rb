class JobsController < ApplicationBaseController
before_action :authorize
  def new
    if current_user.usertype_id == 2
      redirect_to '/jobs'
    else
      @job = Job.new
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    @job.user = current_user
    if @job.save
      redirect_to @job
      puts "saved job"
    else
      redirect_to @job
      puts "Job not saved"
    end
  end

  def show
    @job = Job.find params[:id]
    @comment = Comment.new
    @application = Application.new
  end

  def index
    @jobs = Job.search(params[:search])
    @userjobs = Job.where(user_id: current_user.id)
  end

  def destroy
    @job = Job.find params[:id]
    @job.destroy
    redirect_to action: "index"
  end

  def edit
    @job = Job.find params[:id]
  end

  def update
    if @job = Job.update(job_params)
      redirect_to action: "show"
    else
      redirect_to action: "show"
    end
  end

  def job_params
    params.require(:job).permit(:start_time, :end_time, :user_id, :description, :rate, :status, :jobtype_id, :search)
  end

end
