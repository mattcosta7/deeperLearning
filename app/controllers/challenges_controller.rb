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
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = Challenge.find(params[:id])
    else
      redirect_to current_user
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def destroy
     @challenge = Challenge.find(params[:id])
     if @challenge.destroy
        flash[:notice] = "success, Erin is da best"
        redirect_to root_path
    else
      flash[:notice] = "Matt, what did you do wrong?"
      redirect_to course_challenges_path
    end
  end

  def update
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = Challenge.find(params[:id])
      if @challenge.update_attributes(challenge_params)
        flash[:notice]= "updated challenge"
        redirect_to course_challenge_path(@course,@challenge)
      else
        flash[:notice]= "didn't update"
        redirect_to @challenge
      end
    else
      redirect_to current_user
    end
  end

  private
  def challenge_params
    params.require(:challenge).permit(:course_id,:title,:instructions,:lesson,:problem,:answer,:hints)
  end

end
