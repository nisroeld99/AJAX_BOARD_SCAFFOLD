class RepliesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @reply = Reply.new(reply_params)
    @reply.post_id  = @post.id

    if @reply.save
    respond_to do |format|
      format.js
    end


  else

  end
  end
  def destroy
    @post = Post.find(params[:post_id])
    @reply = Reply.find(params[:id]) # routing상에서 id로 넘어옴
    if @reply.destroy
      respond_to do |format|
        format.js
      end
    end

  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end

end
