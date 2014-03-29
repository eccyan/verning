require 'spec_helper'

describe Object do
  let(:condition) { nil }
  let(:method_name) { nil }

  before do
    Object.send :remove_const, "Upped" if Object.const_defined? "Upped"
    Object.const_set("Upped", Class.new(Object))
    Object.send :remove_const, "Downed" if Object.const_defined? "Downed"
    Object.const_set("Downed", Class.new(Object))
  end

  describe "when blck given" do
    describe "versioned_module" do
      before do
        Object.send(:versioned_module, Downed, Upped) do condition end
      end

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
      before do
        Object.send(:versioned_class, Downed, Upped) do condition end
      end

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

  describe "when release name given" do
    describe "versioned_module" do
      let(:release_name) { :release_name }
      let(:condition) { nil }
      let(:releaser) { double(Releaser, "#{release_name}_releaseable?" => condition) }

      before do
        allow(Verning).to receive(:releaser).and_return(releaser)
      end

      it "call releaseable? method" do
        expect(releaser).to receive(:"#{release_name}_releaseable?")
        Object.send(:versioned_module, Downed, Upped, release_name)
      end

      before do
        Object.send(:versioned_module, Downed, Upped, release_name)
      end

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
      let(:release_name) { :release_name }
      let(:condition) { nil }
      let(:releaser) { double(Releaser, "#{release_name}_releaseable?" => condition) }

      before do
        allow(Verning).to receive(:releaser).and_return(releaser)
      end

      it "call releaseable? method" do
        expect(releaser).to receive(:"#{release_name}_releaseable?")
        Object.send(:versioned_class, Downed, Upped, release_name)
      end

      before do
        Object.send(:versioned_class, Downed, Upped, release_name)
      end

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
end
