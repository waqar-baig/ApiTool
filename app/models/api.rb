class Api < ActiveRecord::Base
  # associations
  belongs_to :service
  has_one :project, through: :service
  has_many :fields

  # delegates
  delegate :name, to: :service, prefix: true
  delegate :name, to: :project, prefix: true

  # attributes

  # validations

  # scopes

  # methods
end
