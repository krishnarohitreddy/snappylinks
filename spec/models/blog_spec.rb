require 'spec_helper'

describe Blog do
  let(:blog) { Blog.create(:name => 'rohit', :email => 'krishnarod@gmail.com', :message => 'this is a message') }
  subject { blog }

  context "validations" do
    it "should validate presence of name" do
      subject.should be_valid
      expect(subject.name).to eq('rohit')
    end

    it "should validate presence of email" do
      expect(subject.email).to eq('krishnarod@gmail.com')
    end
  end
end
