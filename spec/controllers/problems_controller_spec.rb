require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  describe '#index' do
    it { is_expected.to respond_to(:index) }
  end

  describe '#create' do
    it { is_expected.to respond_to(:create) }
  end

  describe '#show' do
    it { is_expected.to respond_to(:show) }
  end

  describe '#put' do
    it { is_expected.to respond_to(:put) }
  end
end
