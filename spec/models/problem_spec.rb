require 'rails_helper'

RSpec.describe Problem, type: :model do
  it { is_expected.to have_many(:solutions).dependent(:destroy) }
end
