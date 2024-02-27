class TodoItem < ApplicationRecord
  belongs_to :user, optional: true
end
