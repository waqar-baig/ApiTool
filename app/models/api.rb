class Api < ActiveRecord::Base
  belongs_to :service
  has_many :fields
end
