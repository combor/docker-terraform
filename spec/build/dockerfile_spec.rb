require_relative '../spec_helper'

describe 'Dockerfile build' do
  it 'creates image' do
    expect(image).not_to be_nil
  end

end
