require 'spec_helper'

describe ResourceGuide do

  def reset_resource_guide(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @resource_guide.destroy! if @resource_guide
    @resource_guide = ResourceGuide.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_resource_guide
  end

  context "validations" do
    
    it "rejects empty title" do
      ResourceGuide.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_resource_guide
      ResourceGuide.new(@valid_attributes).should_not be_valid
    end
    
  end

end