#This is unfortunately named, but is the controller for the applications model, and not the core controller named 'application_controller'

class ApplicationsController < ApplicationBaseController
before_action :authorize
  def create
    @application = Application.new
    @application.job_id = params[:job_id]
    @application.user = current_user
    @application.status = "active"

    if @application.save
      redirect_to @application.job
    else
      @application.errors.each {|e|
        puts e
      }
      redirect_to @application.job
    end
  end

  def index
    if current_user.usertype_id == 1
      redirect_to '/jobs'
    else
      @application = Application.all
      @userapps = @application.where({user_id: current_user.id, status: 'active'})
      @filter = @application.where({user_id: current_user.id, status: 'accepted'})
    end
  end

  def list
    @application = Application.all
  end

  def show
    @application = Application.new
  end

  def update
    @application = Application.find(params[:application_id])
    @application.status = 'Accepted'
    @application.save
    redirect_back fallback_location: jobs_url
  end

end
