class TimeEntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id])
    unless @project
      render :no_projects_found
    end
    @time_entries = @project.time_entries.where("date > ?", Date.today.beginning_of_month)
  end
end
