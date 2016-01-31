class Field < ActiveRecord::Base
  # associations
  belongs_to :api

  # delegates
  delegate :name, to: :api, prefix: true

  # attributes

  # scopes

  # callbacks

  # methods
end
