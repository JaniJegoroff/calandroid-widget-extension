require_relative 'spec_helper'

class SpecButton < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'Button' do
    describe 'Button.class_name' do
      it 'should return class name' do
        Button.class_name.must_equal('Button')
      end
    end

    describe 'Button.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(varkaus oulu kuopio)

        Button.text.must_equal('varkaus')
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:text)

        Button.text(0).must_equal('varkaus')
        $uiquery.must_equal("#{Button.class_name} index:0")
        $args.first.must_equal(:text)

        Button.text('myId').must_equal('varkaus')
        $uiquery.must_equal("#{Button.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end

    describe 'Button.selected?' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [false, true]
        ret = Button.selected?
        ret.must_equal(false)
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:selected)

        $stub_query_response = [false, true]
        ret = Button.selected?(0)
        ret.must_equal(false)
        $uiquery.must_equal("#{Button.class_name} index:0")
        $args.first.must_equal(:selected)

        $stub_query_response = [true, false]
        ret = Button.selected?('myId')
        ret.must_equal(true)
        $uiquery.must_equal("#{Button.class_name} marked:'myId'")
        $args.first.must_equal(:selected)
      end
    end

    describe 'Button.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        Button.touch
        $uiquery.must_equal("#{Button.class_name}")

        Button.touch(0)
        $uiquery.must_equal("#{Button.class_name} index:0")

        Button.touch('myId')
        $uiquery.must_equal("#{Button.class_name} marked:'myId'")

        Button.tap
        $uiquery.must_equal("#{Button.class_name}")

        Button.tap(0)
        $uiquery.must_equal("#{Button.class_name} index:0")

        Button.tap('myId')
        $uiquery.must_equal("#{Button.class_name} marked:'myId'")
      end
    end

    describe 'Button.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        Button.property(:finland)
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:finland)

        Button.prop(:finland)
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:finland)

        Button.p(:finland)
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'Button.id' do
      it 'should call Calabash query method with correct parameters' do
        Button.id
        $uiquery.must_equal("#{Button.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
