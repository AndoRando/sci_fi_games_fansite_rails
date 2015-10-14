class OpinionsController < ApplicationController
  def new
    @contribution = Contribution.find(params[:contribution_id])
    @opinion = @contribution.opinions.new
  end

  def create
    @contribution = Contribution.find(params[:contribution_id])
    @opinion = @contribution.opinions.new(opinion_params)
    if @opinion.save
      flash[:notice] = "Thanks for your opinion!"
      redirect_to contribution_path(@contribution)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    contribution_id = params[:contribution_id]
    @opinion.destroy
    redirect_to contribution_path(contribution_id)
  end

  private
  def opinion_params
    params.require(:opinion).permit(:title, :content)
  end
end
