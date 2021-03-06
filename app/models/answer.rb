class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commenter
  has_many :votes, as: :votable, dependent: :destroy
  validates :body, presence: true

  
end
