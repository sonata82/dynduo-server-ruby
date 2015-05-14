class ProjectsController < ApplicationController
  protect_from_forgery except: :index

  def index
    @projects = Project.all
    @projects = Project.order(params[:orderBy][:column] + " " + params[:orderBy][:direction]) unless params[:orderBy].blank?

    respond_to do |format|
      if params[:callback]
        format.js { render :json => @projects, :callback => params[:callback] }
      else
        format.html
        format.json { render json: @projects }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    @project.save
    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :beginDate, :endDate, :description,
      used_skills_attributes: [:id, :skill_id, :_destroy, skill_attributes: [:id, :name]])
    end
end
