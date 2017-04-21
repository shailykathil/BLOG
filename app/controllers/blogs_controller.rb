class BlogsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
	def index
   if params[:search].present?
        @blogs = Blog.where('title LIKE ? OR description LIKE ?', "%#{params[:search]}%",
        "%#{params[:search]}%")
      elsif params[:start_date].present? && params[:end_date].present?
      @blogs = Blog.where('created_at >= ? AND created_at <=?',
      params[:start_date].to_date, params[:end_date].to_date) 
      else 
        @blogs = Blog.all 
     end
  end

	 def show
    @blog = Blog.find(params[:id])
  end

def new
  @blog = Blog.new
end
 
 def edit
  @blog = Blog.find(params[:id])
end

def create
  @blog = Blog.new(blog_params)
  if @blog.save
   params[:blog][:image].each do |image|
   Image.create(:image=> image, blog_id: @blog.id)
  end
    redirect_to @blog
  else
    render 'new'
  end
end
 
 def update
  @blog = Blog.find(params[:id])
  if @blog.update(blog_params)
     # images = Image.where(:article_id=>@article.id)
     images = @blog.images
     if params[:blog][:image].present?
       images.destroy_all
       params[:blog][:image].each do |image|
       Image.create(:image=> image, blog_id: @blog.id)
     end
   end
    redirect_to @blog
  else
    render 'edit'
  end
end

def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
 
    redirect_to blogs_path
  end

private
  def blog_params
    params.require(:blog).permit(:title, :description, :image, :video, :category_id)
  end
end
