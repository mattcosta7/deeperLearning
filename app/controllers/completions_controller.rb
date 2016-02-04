class CompletionsController < ApplicationController

  def create
    @comp = Completion.new(completer_id: current_user.id, completed_id: params[:id])
  end


end