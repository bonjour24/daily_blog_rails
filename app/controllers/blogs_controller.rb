class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end

  def list
    @blogs=Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new 
    @blog=Blog.new
  end

  def create
    @author=Author.find(params[:author_id])
    @blog=@author.blogs.create(blog_params)

    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(params[:author_id])
    @blog = @author.blogs.find(params[:id])
    @blog.destroy
    
    redirect_to author_path(@author)
  end

  def edit
    @blog=Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog=Blog.find(params[:id])
    @blog.destroy

    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end