class ArticleSerializer < ActiveModel::Serializer

  attributes :owner_name, :id, :name, :price, :description
  
  def owner_name
  	object.owner.name
  end
end  