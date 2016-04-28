class TimeEntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entries = @project.time_entries.where("date > ?", Date.today.beginning_of_month)
  end

  def new
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entry = @project.time_entries.new
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entry = @project.time_entries.new(entry_params)
    if @time_entry.save
      flash[:notice] = "Time entry created sucessfully"
      redirect_to project_time_entries_path(@project)
    else
      flash.now[:alert] = "ERROR!"
      render "new"
    end
  end

  def edit
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entry = @project.time_entries.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entry = @project.time_entries.find_by(id: params[:id])
    if @time_entry.update(entry_params)
      redirect_to project_time_entries_path(@project.id)
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entry = @project.time_entries.find_by(id: params[:id])
    @time_entry.destroy
    redirect_to project_time_entries_path(@project.id)
  end

  private
  def entry_params
    params.require(:time_entry).permit(:hours, :minutes, :comments, :date)
  end
end
