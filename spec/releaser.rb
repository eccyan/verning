require 'spec_helper'

describe Releaser do
  describe "#initialize" do
    it "set schedule" do
      expect_any_instance_of(Releaser).to receive(:set_schedule)
      Releaser.new key: :value
    end
  end

  describe "#set_schedule" do
    let(:scheduler) { Releaser.new }
    let(:name) { :name }
    let(:release_conditions) { { } }

    before do
      scheduler.set_schedule(name, release_conditions)
    end

    it "define #{name}_release_conditions instance variable" do
      expect(scheduler.methods)
        .to be_include(:"#{name}_release_conditions")
    end

    it "define #{name}_releaseable? method" do
      expect(scheduler.methods)
        .to be_include(:"#{name}_releaseable?")
    end

    describe "##{name}_release_conditions" do
      let(:release_conditions) do { test: :hash } end

      it "returns release_conditions" do
        expect(scheduler.send(:"#{name}_release_conditions"))
          .to eq(release_conditions)
      end
    end

    describe "##{name}_releaseable?" do
      describe "when have date condition" do
        describe "when in date range" do
          let(:release_conditions) do
            { "date" => { "start" => Time.now - 24*3600, "end" => Time.now + 24*3600 } }
          end

          it "returns true" do
            expect(scheduler.send(:"#{name}_releaseable?")).to be_true
          end
        end

        describe "when not in date range" do
          let(:release_conditions) do
            { "date" => { "start" => Time.now - 24*3600, "end" => Time.now - 24*3600 } }
          end

          it "returns false" do
            expect(scheduler.send(:"#{name}_releaseable?")).to be_false
          end
        end

        describe "when start date is nil" do
          let(:release_conditions) do
            { "date" => { "start" => nil, "end" => Time.now + 24*3600 } }
          end

          it "returns true" do
            expect(scheduler.send(:"#{name}_releaseable?")).to be_true
          end
        end

        describe "when end date is nil" do
          let(:release_conditions) do
            { "date" => { "start" => Time.now - 24*3600, "end" => nil } }
          end

          it "returns true" do
            expect(scheduler.send(:"#{name}_releaseable?")).to be_true
          end
        end
      end
    end
  end
end
