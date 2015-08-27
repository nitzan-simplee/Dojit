class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end

  def show
   @post = Post.find(params[:post_id])
   @comment = @post.comments.find(params[:id])
 end

 def edit
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:comment_id])
  authorize @comment
end

def create
  @post = Post.find(params[:post_id])
  @topic = @post.topic    
  @comment = @post.comments.build(comment_params)
  @comment.user = current_user
  authorize @comment
  if @comment.save
    flash[:notice] = "Comment was saved."
    redirect_to [@topic,@post]
  else
    flash[:error] = "There was an error saving the comment. Please try again."
    @comments = @post.reload.comments
    render 'posts/show'
  end
end

def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  authorize @comment

  if @comment.destroy
    flash[:notice] = "Comment was removed."
  else
    flash[:error] = "There was an error deleting the comment. Please try again."
  end

  respond_with(@comment) do |format|
    format.html { redirect_to [@post.topic, @post]}
  end
end

def post_url (post)
  url_for([post.topic, post])
end

def comment_params
  params.require(:comment).permit(:body)
end
end