module API
  module V1
    class Articles < Grape::API

      resource :articles do
        desc "Return all articles based on the owner id"
        get ":id"  do
          article = Article.find(params[:id])
          raise ActiveRecord::RecordNotFound if article.nil?
          article
        end
      end

      desc "Return articles based on owner name"
      get ":owner_name/articles" do 
       	owner = Owner.find_by_name(params[:owner_name])
       	raise ActiveRecord::RecordNotFound if owner.nil?
       	articles = ActiveModel::SerializableResource.new(owner.articles, each_serializer: ArticleSerializer).as_json
       	{owner_name: owner.name, articles: articles}
      end

      end
    end
end