class BlogsController < ApplicationController

  #before_action :move_to_index, except: :index

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end  

  def new
  end
  
  def create
    Blog.create(text: blog_params[:text], intro: blog_params[:intro], image: blog_params[:image], user_id: current_user.id)
  end

  def destroy
       blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
  end

  def edit
     @blog = Blog.find(params[:id])
  end

  def update
       blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
       blog.update(blog_params)
    end  
  end

  def show
    @blog = Blog.find(params[:id])
    @time_date = @blog.created_at.strftime("%Y/%m/%d %H:%M")
    @modified_date = @blog.updated_at.strftime("%Y/%m/%d %H:%M")
  end
  
  private
  def blog_params
    params.permit(:text, :intro, :image, :created_at, :updated_at)
  end  
   
  def move_to_index
       redirect_to action: :index unless user_signed_in?
  end
end
