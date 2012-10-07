# -*- coding: utf-8 -*-

################################
# This is shared_examples sample
################################

#######
# Usage
#######

# e.g. {PROJECT_ROOT}/spec/shared_examples_for_#{name}.rb

# Sandard
shared_examples_for 'a sample array' do
  subject { [ 1, 2, 3, :foo, :bar ] }
  its(:size) { should eq 5 }
  it { should include :bar }
end

describe Array do
  it_behaves_like 'a sample array'
end

# With block
shared_examples_for 'String instance' do
  subject { str.is_a?(String) }
  it { should be_true }
end

describe "string created by leteral" do
  it_behaves_like 'String instance' do
    let(:str) { "sample" }
  end
end

describe "string created by leteral" do
  let(:str) { "sample" }
  it_behaves_like 'String instance'
end

# With block and args
shared_examples_for 'a string equal to' do |string_expect_to_equal|
  subject { str }
  it { should eq(string_expect_to_equal) }
end

describe String do
  it_behaves_like 'a string equal to', 'foo' do
    let(:str) { 'foo' }
  end
end

# But, you don't have to use let in block given shared_examples
shared_examples_for 'String instance2' do
  subject { str.is_a?(String) }
  it { should be_true }
end
