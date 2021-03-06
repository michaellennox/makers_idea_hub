class Solution < ActiveRecord::Base
  belongs_to :problem
  has_many :replies, dependent: :destroy
  has_many :upvotes, dependent: :destroy
end
