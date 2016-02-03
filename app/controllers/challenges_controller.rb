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
  end
  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
