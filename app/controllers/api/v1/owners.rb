module API
  module V1
    class Owners < Grape::API

      resource :owners do
        desc "Return all owners available"
        get ""  do
          owners = ActiveModel::SerializableResource.new(Owner.all, each_serializer: OwnerSerializer).as_json
          {owners: owners}
        end
      end

      desc "Return owner name"
      get ":owner_name" do 
        owner = Owner.find_by_name(params[:owner_name])
        raise ActiveRecord::RecordNotFound if owner.nil?
        owner
      end    

      end
    end
end