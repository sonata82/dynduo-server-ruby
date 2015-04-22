class SkillsController < ApplicationController
  def index
    @skills = Skill.all
    @skills = Skill.where("useInWordcloud = ", params[:useInWordcloud]) unless params[:useInWordcloud].blank?

    respond_to do |format|
      format.html
      format.json { render json: @skills }
    end
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.new(skill_params)

    @skill.save
    redirect_to @skill
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      redirect_to @skill
    else
      render 'edit'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    redirect_to skills_path
  end

  private
    def skill_params
      params.require(:skill).permit(:name, :iconUrl, :useInWordcloud)
    end
end
