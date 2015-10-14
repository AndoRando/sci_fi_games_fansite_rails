require 'rails_helper'

describe Opinion do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :contribution_id }
end
