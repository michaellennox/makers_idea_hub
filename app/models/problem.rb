class Problem < ActiveRecord::Base
  has_many :solutions, dependent: :destroy
  has_many :upvotes, dependent: :destroy
end
