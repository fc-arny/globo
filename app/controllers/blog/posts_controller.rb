# -------------------------------------------------------------
# Blog post actions -> view
# -------------------------------------------------------------
class Blog::PostsController < FrontendController
  # Show
  def show
    post_id = params[:post].split('-').first
    @post = Sap::BlogPost.find(post_id)
  end
end