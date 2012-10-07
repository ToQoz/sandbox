#####################################
# This is a sample of custom matcher
#####################################

# Standerd
RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end
end
describe 9 do
  it { described_class.should be_a_multiple_of(3) }
end

# Paremeterized Matcher(?)
describe Array do
  RSpec::Matchers.define :be_a_array_include_all_of do |*expected|
    match do |instance|
      expected.all? do |e|
        instance.include? e
      end
    end
  end

  describe [ 1, 2, 3, 4 ] do
    subject { [ 1, 2, 3, 4 ] }
    it { should be_a_array_include_all_of(1, 2, 3) }
  end
end
