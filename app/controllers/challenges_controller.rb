class ChallengesController < ApplicationController
  
  def index
    redirect_to course_path(params[:course_id])
  end

# if current user is admin, then create challenges, otherwise redirect
  def new
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = @course.challenges.build
    else
      redirect_to current_user
    end
  end

# if current user is admin, then create challenges, otherwise redirect
  def create
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = @course.challenges.build(challenge_params)
      if @challenge.save
        flash[:notice]="Challenge Saved"
        redirect_to admin_path
      else
        flash[:notice]="Challenge Didn't Save"
        redirect_to :back
      end
    end
  end

# if current user is admin, then edit challenges, otherwise redirect
  def edit
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = Challenge.find(params[:id])
    else
      redirect_to current_user
    end
  end

#show a challenge by params id
  def show
    if Challenge.exists?(params[:id])
      @challenge = Challenge.find(params[:id])
      @course = Course.find(params[:course_id])
    else
      flash[:notice]="You cray"
      redirect_to root_path
    end
  end

#destroy a challenge if user is admin, else redirect
  def destroy
    if current_user.admin
      @challenge = Challenge.find(params[:id])
      if @challenge.destroy
          flash[:notice] = "success, Erin is da best, at being da worstest"
          redirect_to admin_path
      else
        flash[:notice] = "Q: Matt, what did you do wrong? A: Nothing, ever"
        redirect_to course_challenges_path
      end
    else
      redirect_to current_user
    end
  end

#update challenge if current user is admin, else redirect
  def update
    if current_user.admin
      @course = Course.find(params[:course_id])
      @challenge = Challenge.find(params[:id])
      if @challenge.update_attributes(challenge_params)
        flash[:notice]= "updated challenge"
        redirect_to admin_path
      else
        flash[:notice]= "didn't update"
        redirect_to @challenge
      end
    else
      redirect_to current_user
    end
  end

#strong params for challenge
  private
  def challenge_params
    params.require(:challenge).permit(:course_id,:title,:instructions,:lesson,:problem,:answer,:hints)
  end

end
