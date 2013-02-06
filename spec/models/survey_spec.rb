require 'spec_helper'

describe Survey do
  let(:survey) { Survey.new }

  it { should belong_to(:user) }
  it { should have_many(:blanks).dependent(:destroy) }

  describe "#valid?" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:name) }
  end

  describe "#parsed_body" do
    it "returns body with text fields inserted" do
      survey.body = "my awesome stuff _tag1_ " <<
                    "<a href='/some/site'>blah</a>"

      survey.parsed_body.should eq "my awesome stuff " <<
        "<input id=\"tag1\" name=\"tag1\" type=\"text\" /> " <<
        "<a href=\"/some/site\">blah</a>"
    end

    context "when body is assigned with malicious code" do
      it "the code is stripped out" do
        survey.body = "my awesome stuff _tag1_ " <<
                      "<a href='/some/site'>blah</a>" <<
                      "<script> bad stuff here </script>"

        survey.parsed_body.should eq "my awesome stuff " <<
          "<input id=\"tag1\" name=\"tag1\" type=\"text\" /> " <<
          "<a href=\"/some/site\">blah</a>"
      end
    end
  end
end
