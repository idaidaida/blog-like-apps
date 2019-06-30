class BlogsController < ApplicationController

    def index
        @blogs = Blog.all
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(create_params)
        if @blog.save
            flash[:info] = "Success to create new blog"
            redirect_to root_url
        else
            render "new"
        end
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog && @blog.update_attributes(update_params)
            flash[:info] = "Success to update blog"
            redirect_to root_url
        else
            render "edit"
        end
    end

    def destroy
        blog = Blog.find(params[:id])
        blog.destroy
        flash[:info] = "Success to delete blog"
        redirect_to root_url
    end

    private
        def create_params
            params.require(:blog).permit(:title)
        end

        def update_params
            params.require(:blog).permit(:title)
        end

end
