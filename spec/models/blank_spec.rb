require 'spec_helper'

describe Blank do
  it { should belong_to(:survey) }
  it { should have_many(:responses).dependent(:destroy) }

  describe "#valid?" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:survey) }
  end
end
