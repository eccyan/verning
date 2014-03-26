require 'spec_helper'

describe Object do
  let(:condition) { nil }
  let(:method_name) { nil }

  before do
    Object.send :remove_const, "Upped" if Object.const_defined? "Upped"
    Object.const_set("Upped", Class.new(Object))
    Object.send :remove_const, "Downed" if Object.const_defined? "Downed"
    Object.const_set("Downed", Class.new(Object))

    Object.send(method_name, Downed, Upped) do condition end
  end

  describe "versioned_module" do
    let(:method_name) { :versioned_module }

    describe "when not matches the conditions"do
      let(:condition) { false }

      it "not aliased target method" do
        expect(Downed.new).to be_kind_of(Downed)
      end
    end

    describe "when matches the conditions"do
      let(:condition) { true }

      it "aliased target method" do
        expect(Downed.new).to be_kind_of(Upped)
      end
    end
  end
  describe "versioned_class" do
    let(:method_name) { :versioned_class }

    describe "when not matches the conditions"do
      let(:condition) { false }

      it "not aliased target method" do
        expect(Downed.new).to be_kind_of(Downed)
      end
    end

    describe "when matches the conditions"do
      let(:condition) { true }

      it "aliased target method" do
        expect(Downed.new).to be_kind_of(Upped)
      end
    end
  end
end
