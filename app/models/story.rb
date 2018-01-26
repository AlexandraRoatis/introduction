class Story < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { minimum: 5, maximum: 140}, on: :create
  has_many :guesses
  
  def user_has_guessed? u
    guesses.where(user: u).exists?
  end
  
  def get_guess_for_user u
    guesses.where(user: u).take
  end
end
