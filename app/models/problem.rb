class Problem < ActiveRecord::Base
  has_many :solutions, dependent: :destroy
end
