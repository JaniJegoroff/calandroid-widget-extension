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
  end
end
