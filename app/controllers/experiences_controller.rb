class ExperiencesController < ApplicationController

  def new
    @user = User.find(params[:id])
    @experience = Experience.new
  end

  def index
    @experience = Experience.all
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    if @experience.save
      puts "saved experience"
      redirect_to controller: 'users', action: 'show', id: @current_user.id
    else
      puts "experience failed"
      @experience.errors.each {|e|
        puts e
      }
      redirect_to controller: 'users', action: 'show', id: @experience.user_id
    end
  end

  def show
    @experience = Experience.find(params[:id])
  end

  private

  def experience_params
    params.require(:experience).permit(:jobtype_id, :employer_name, :months, :description)
  end

end