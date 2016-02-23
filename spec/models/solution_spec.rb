require 'rails_helper'

RSpec.describe Solution, type: :model do
  it { is_expected.to belong_to(:problem) }
end
