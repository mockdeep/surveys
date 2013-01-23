require 'spec_helper'

describe Response do
  it { should belong_to(:blank) }
  it { should belong_to(:user) }

  describe "#valid?" do
    it { should validate_presence_of(:blank) }
  end
end
