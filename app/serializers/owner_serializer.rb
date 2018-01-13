class OwnerSerializer < ActiveModel::Serializer

  attributes :owner_name

  def owner_name
  	object.name
  end
  
end  