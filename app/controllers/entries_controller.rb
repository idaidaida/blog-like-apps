class EntriesController < ApplicationController


    def show
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:id])
        
    end

    def new
        @blog = Blog.find(params[:blog_id])
        @entry = Entry.new
    end

    def create
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.new(create_params)
        if @entry.save
            flash[:info] = "Success to create new entry"
            redirect_to blog_url(@blog)
        else
            render "new"
        end
    end

    def edit
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:blog_id])
        @entry = @blog.entries.find(params[:id])
        if @entry && @entry.update_attributes(update_params)
            flash[:info] = "Success to update entry"
            redirect_to blog_url(@blog)
        else
            render "edit"
        end
    end

    def destroy
        @blog = Blog.find(params[:blog_id])
        entry = @blog.entries.find(params[:id])
        entry.destroy
        flash[:info] = "Success to delete entry"
        redirect_to blog_url(@blog)
    end

    private
        def create_params
            params.require(:entry).permit(:title,:body)
        end

        def update_params
            params.require(:entry).permit(:title,:body)
        end

end
