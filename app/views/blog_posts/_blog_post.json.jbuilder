json.extract! blog_post, :id, :title, :summary, :content, :user_id, :title_image_url, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)
