class Owner < ApplicationRecord
	has_many :articles, dependent: :destroy
	validates_presence_of :name	
end
