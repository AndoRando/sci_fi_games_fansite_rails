class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
    render :index
  end

  def show
    @contribution = Contribution.find(params[:id])
    render :show
  end

  def new
    @contribution = Contribution.new
    render :new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      flash[:notice] = "Contribution added!"
      redirect_to contributions_path
    else
      render :new
    end
  end

  def edit
    @contribution = Contribution.find(params[:id])
    render :edit
  end

  def update
    @contribution = Contribution.find(params[:id])
    if @contribution.update(contribution_params)
      redirect_to contributions_path
    else
      render :edit
    end
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    redirect_to contributions_path
  end

  private
  def contribution_params
    params.require(:contribution).permit(:name, :content, :rating_total, :rating_count, :subgenre)
  end

end
