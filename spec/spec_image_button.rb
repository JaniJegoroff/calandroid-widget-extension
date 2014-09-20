require_relative 'spec_helper'

class SpecImageButton < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'ImageButton' do
    describe 'ImageButton.class_name' do
      it 'should return class name' do
        ImageButton.class_name.must_equal('ImageButton')
      end
    end

    describe 'ImageButton.selected?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = ImageButton.selected?
        ret.must_equal(false)
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:selected)

        $stub_query_response = [false, true]
        ret = ImageButton.selected?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{ImageButton.class_name} index:0")
        $args.first.must_equal(:selected)

        $stub_query_response = [true, false]
        ret = ImageButton.selected?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{ImageButton.class_name} marked:'myId'")
        $args.first.must_equal(:selected)
      end
    end

    describe 'ImageButton.activated?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = ImageButton.activated?
        ret.must_equal(false)
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:activated)

        $stub_query_response = [false, true]
        ret = ImageButton.activated?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{ImageButton.class_name} index:0")
        $args.first.must_equal(:activated)

        $stub_query_response = [true, false]
        ret = ImageButton.activated?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{ImageButton.class_name} marked:'myId'")
        $args.first.must_equal(:activated)
      end
    end

    describe 'ImageButton.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        ImageButton.touch
        $uiquery.must_equal("#{ImageButton.class_name}")

        ImageButton.touch(0)
        $uiquery.must_equal("#{ImageButton.class_name} index:0")

        ImageButton.touch('myId')
        $uiquery.must_equal("#{ImageButton.class_name} marked:'myId'")

        ImageButton.tap
        $uiquery.must_equal("#{ImageButton.class_name}")

        ImageButton.tap(0)
        $uiquery.must_equal("#{ImageButton.class_name} index:0")

        ImageButton.tap('myId')
        $uiquery.must_equal("#{ImageButton.class_name} marked:'myId'")
      end
    end

    describe 'ImageButton.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        ImageButton.property(:finland)
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:finland)

        ImageButton.prop(:finland)
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:finland)

        ImageButton.p(:finland)
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'ImageButton.id' do
      it 'should call Calabash query method with correct parameters' do
        ImageButton.id
        $uiquery.must_equal("#{ImageButton.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
