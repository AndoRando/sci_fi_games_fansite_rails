class ContributionsController < ApplicationController
  def index
    @contributions = Contribution.all
    render :index
  end

  def show
    @contribution = Contribution.find(params[:id])
    render :show
  end

  # def new
  # end
  #
  # def create
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

end
