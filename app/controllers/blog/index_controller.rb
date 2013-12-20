class Blog::IndexController < FrontendController

  # List
  def index
    @posts = Sap::BlogPost.recent.page(params[:page]).per(5)

    if params[:category]
      @posts.last_posts params[:category].strip
    end
  end

  # Show
  def show

  end
end
