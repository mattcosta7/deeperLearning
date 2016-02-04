class ChallengesController < ApplicationController
  
  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      flash[:notice]="Challenge Saved"
    else
      flash[:notice]="Challenge Didn't Save"
    end
    redirect_to admin_path
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def destroy
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(challenge_params)
      flash[:notice]= "updated challenge"
      redirect_to @challenge
    else
      flash[:notice]= "didn't update"
      redirect_to @challenge
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:course_id,:title,:instructions,:lesson,:problem,:answer,:hints)
  end

end
