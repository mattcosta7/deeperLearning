class ChallengesController < ApplicationController
  
  def index
    @challenges = Challenge.all
  end

  def new
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = @course.challenges.build
    else
      redirect_to current_user
    end
  end

  def create
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = @course.challenges.build(challenge_params)
      if @challenge.save
        flash[:notice]="Challenge Saved"
      else
        flash[:notice]="Challenge Didn't Save"
      end
      redirect_to current_user
    else
      redirect_to current_user
    end
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
