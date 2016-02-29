require 'rails_helper'

RSpec.describe Upvote, type: :model do
  it { is_expected.to belong_to(:problem) }
  it { is_expected.to belong_to(:solution) }
end
