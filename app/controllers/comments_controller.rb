class CommentsController < ApplicationController

    def create
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:entry_id])
        @comment = @entry.comments.new(create_params)
        @comment.status = "unapproved"
        if @entry.save
            flash[:info] = "Success to create new comment"

            # メールを送信する
            NoticeMailer.with(blog: @blog,entry: @entry, comment: @comment).comment_notify_mail.deliver_later

            redirect_to blog_entry_url(@blog,@entry)
        else
            render "new"
        end
    end

    def destroy
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:entry_id])
        comment = @entry.comments.find(params[:id])
        comment.destroy
        flash[:info] = "Success to delete entry"
        redirect_to blog_entry_url(@blog,@entry)
    end

    def approve
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:entry_id])
        comment = @entry.comments.find(params[:id])
        comment.status = "approved"
        comment.save
        flash[:info] = "Success to approve comment"
        redirect_to blog_entry_url(@blog,@entry)
    end
        

    private
        def create_params
            params.require(:comment).permit(:body)
        end

end
