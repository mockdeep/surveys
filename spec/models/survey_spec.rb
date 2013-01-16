require 'spec_helper'

describe Survey do
  it { should belong_to(:user) }
  it { should have_many(:blanks) }

  describe "#valid?" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:name) }
  end

end
