require 'spec_helper'

describe Module do
  before do
    Object.send :remove_const, "TestClass" if Object.const_defined? "TestClass"
    Object.const_set("TestClass", Class.new(Object))

    TestClass.class_eval do
      define_method(:upped) { :upped }
      define_method(:downed) { :downed }
    end
  end

  describe "when block given" do
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

  describe "when release name given" do
    let(:release_name) { :release_name }
    let(:condition) { nil }
    let(:releaser) { double(Releaser, "#{release_name}_releaseable?" => condition) }

    before do
      allow(Verning).to receive(:releaser).and_return(releaser)
    end

    it "call releaseable? method" do
      expect(releaser).to receive(:"#{release_name}_releaseable?")
      TestClass.send(:versioned_method, :downed, :upped, release_name)
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
end
