require File.dirname(__FILE__) + '/../spec_helper'

describe Hierarchy do
  it "should be valid" do
    Hierarchy.new.should be_valid
  end
end
