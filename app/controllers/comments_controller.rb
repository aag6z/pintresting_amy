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
   # @comment = Comment.new
   # respond_with(@comment)
    
  end

  def edit
  end

  def create   
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(comment_params)
    #@comment = @pin.comments.build(comment_params)
    #@comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    #current_user.comments << @comment
    if @comment.save
      #@pin.comment_id  = @comment.id
      #@pin.save
      redirect_to pins_path, notice: 'Thanks!'
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
