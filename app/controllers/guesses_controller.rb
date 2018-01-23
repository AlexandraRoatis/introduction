class GuessesController < ApplicationController
  def new
  end
  
  def create
    story = Story.find(params[:story_id])
    author = User.find(params[:guess][:author_id])
    story.guesses.create(user: current_user, author: author)
    redirect_to story_path(story)
  end
 
  private
    def guess_params
      params.require(:guess).permit(:author_id)
    end
  
end
