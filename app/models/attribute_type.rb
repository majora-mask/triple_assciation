class AttributeType < ApplicationRecord
  belongs_to :actor , optional: true
  has_many :settings
end
