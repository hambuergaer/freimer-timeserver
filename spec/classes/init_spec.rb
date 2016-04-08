require 'spec_helper'
describe 'timeserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('timeserver') }
  end
end
