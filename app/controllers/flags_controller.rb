class FlagsController < ApplicationController
  before_action :authenticate_user!

	  def show
        @comment = Flag.where("#[current_user.id]")
    end
        
    def update
        @comment = Comment.find(params[:id])
          type = params[:type]
          if type == "report"
            current_user.flagged_comments << @comment
            redirect_to :back, notice: "comment Flagged!"
          elsif type == "unreport"
            current_user.flagged_comments.delete(@comment)
            redirect_to :back, notice: 'comment Unflagged'
        end
    end
end

