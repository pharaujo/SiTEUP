require File.dirname(__FILE__) + '/../spec_helper'

describe Availability do
  it "should be valid" do
    Availability.new.should be_valid
  end
end
