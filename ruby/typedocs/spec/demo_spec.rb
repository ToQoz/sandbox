require 'spec_helper'
require 'demo'

describe A do
  describe '#square' do
    context 'when given Numeric for arg' do
      let (:arg) { 10 }
      it { expect { described_class.new.square arg }.not_to raise_error }
    end
    context 'when given String for arg' do
      let (:arg) { '10' }
      it { expect { described_class.new.square arg }.to raise_error(Typedocs::ArgumentError) }
    end
  end
end
