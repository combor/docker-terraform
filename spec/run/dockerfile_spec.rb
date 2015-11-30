require_relative '../serverspec_helper'

describe 'Docker image run' do

  describe package('wget') do
    it { should be_installed }
  end
end
