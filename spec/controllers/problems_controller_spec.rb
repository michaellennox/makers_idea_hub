require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  describe '#index' do
    it { is_expected.to respond_to(:index) }
  end
end
