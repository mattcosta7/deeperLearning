class CompletionsController < ApplicationController

  def create
    @comp = Completion.new(completer_id: current_user.id, completed_id: params[:id])
    @comp.save
    respond_to do |format|
      format.js
    end
  end


end