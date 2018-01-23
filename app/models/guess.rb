class Guess < ApplicationRecord
  belongs_to :story
  belongs_to :user
  belongs_to :author, :class_name => 'User' 
end
