require_relative 'spec_helper'

class SpecFrameLayout < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'FrameLayout' do
    describe 'FrameLayout.class_name' do
      it 'should return class name' do
        FrameLayout.class_name.must_equal('FrameLayout')
      end
    end

    describe 'FrameLayout.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        FrameLayout.touch
        $uiquery.must_equal("#{FrameLayout.class_name}")

        FrameLayout.touch(0)
        $uiquery.must_equal("#{FrameLayout.class_name} index:0")

        FrameLayout.touch('myId')
        $uiquery.must_equal("#{FrameLayout.class_name} marked:'myId'")

        FrameLayout.tap
        $uiquery.must_equal("#{FrameLayout.class_name}")

        FrameLayout.tap(0)
        $uiquery.must_equal("#{FrameLayout.class_name} index:0")

        FrameLayout.tap('myId')
        $uiquery.must_equal("#{FrameLayout.class_name} marked:'myId'")
      end
    end

    describe 'FrameLayout.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        FrameLayout.property(:finland)
        $uiquery.must_equal("#{FrameLayout.class_name}")
        $args.first.must_equal(:finland)

        FrameLayout.prop(:finland)
        $uiquery.must_equal("#{FrameLayout.class_name}")
        $args.first.must_equal(:finland)

        FrameLayout.p(:finland)
        $uiquery.must_equal("#{FrameLayout.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'FrameLayout.id' do
      it 'should call Calabash query method with correct parameters' do
        FrameLayout.id
        $uiquery.must_equal("#{FrameLayout.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
