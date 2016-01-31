class Service < ActiveRecord::Base
  # associations
  belongs_to :project
  has_many :apis

  # delegates
  delegate :name, to: :project, prefix: true

  # attributes

  # scopes

  # callbacks

  # methods
end
