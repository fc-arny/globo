class Blog::IndexController < FrontendController

  # List
  def index
    relation = Sap::BlogPost.recent

    if params[:category]
      @category = Sap::BlogCategory.where('url = ?', params[:category].strip).first
      relation = relation.last_posts @category.url
    end

    @posts = relation.page params[:page]
  end
end
