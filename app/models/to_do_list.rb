# frozen_string_literal: true

class ToDoList < ApplicationRecord
  belongs_to :user

  validates :to_do, presence: true, length: { maximum: 140 }
end
