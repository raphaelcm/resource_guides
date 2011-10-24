require 'spec_helper'

describe GuideCategory do

  def reset_guide_category(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @guide_category.destroy! if @guide_category
    @guide_category = GuideCategory.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_guide_category
  end

  context "validations" do
    
    it "rejects empty name" do
      GuideCategory.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_guide_category
      GuideCategory.new(@valid_attributes).should_not be_valid
    end
    
  end

end