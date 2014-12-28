class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    
  end

  def show
   
  end

  def new
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build
    respond_with(@comment)
    
  end

  def edit
  end

  def create   
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(comment_params)
    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @comment.update(comment_params)
    
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
   
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
