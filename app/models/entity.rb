class Entity < ActiveRecord::Base
  # associations
  belongs_to :project

  # delegates
  delegate :name, to: :project, prefix: true

  # attributes

  # scopes

  # callbacks

  # methods
end
