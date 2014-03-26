require 'spec_helper'

describe Module do
  class TestClass
    def upped; :upped end
    def downed; :downed end
  end

  before do
    TestClass.send(:versioned_method, :downed, :upped) do condition end
  end

  describe "when not matches the conditions"do
    let(:condition) { false }

    it "not aliased target method" do
      expect(TestClass.new.downed).to eq(:downed)
    end
  end

  describe "when matches the conditions"do
    let(:condition) { true }

    it "aliased target method" do
      expect(TestClass.new.downed).to eq(:upped)
    end
  end
end
