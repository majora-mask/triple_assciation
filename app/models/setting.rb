class Setting < ApplicationRecord
  belongs_to :attribute_type
  belongs_to :actor
end
