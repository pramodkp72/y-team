class PlaceCommentsController < ApplicationController
  def index
    @place_comments = PlaceComment.all
  end

  def new
    @place_comment = PlaceComment.new
  end

  def create
    # @places = Places.all
    @place_comment = PlaceComment.new(user_params)
    # testing
    @place_comment.user_id = 1
    @place_comment.place_id = 1
    @place_comment.rating = 5

    @place_comment.flagged = 0
    @place_comment.enabled = 1
    @place_comment.save!

    flash[:success] = @place_comment.title + " has been added"
    redirect_to action: "index"
  end

  private
  def user_params
    params.require(:place_comment).permit(:title, :text, :rating)
  end
end
