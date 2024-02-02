class BlogPostsController < ApplicationController
  include SessionsHelper
  before_action :set_blog_post, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /blog_posts or /blog_posts.json
  def index
    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @blog_posts = BlogPost.where("LOWER(title) LIKE ? OR LOWER(summary) LIKE ?", search_term, search_term).order(created_at: :desc)
    else
      @blog_posts = BlogPost.order(created_at: :desc)
    end
  end  

  def blogpost_user_index
    @blog_posts = current_user.blog_posts.order(created_at: :desc)
  end

  # GET /blog_posts/1 or /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
    @user = User.find(current_user.id)
    @blogpost = BlogPost.find(params[:id])
    if !@user.is_admin or @user.id != @blogpost.user_id
      redirect_to(root_url) 
    end
  end

  # POST /blog_posts or /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was successfully created." }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1 or /blog_posts/1.json
  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was successfully updated." }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1 or /blog_posts/1.json
  def destroy
    @blog_post.taggings.destroy_all
    @blog_post.destroy

    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: "Blog post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :summary, :content, :user_id, :title_image_url, :search, :tag_list)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(current_user.id)
      redirect_to(root_url) unless @user == current_user || current_user.is_admin? 
    end
end
