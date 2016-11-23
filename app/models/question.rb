class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
