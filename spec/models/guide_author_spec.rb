require 'spec_helper'

describe GuideAuthor do

  def reset_guide_author(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @guide_author.destroy! if @guide_author
    @guide_author = GuideAuthor.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_guide_author
  end

  context "validations" do
    
    it "rejects empty name" do
      GuideAuthor.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_guide_author
      GuideAuthor.new(@valid_attributes).should_not be_valid
    end
    
  end

end