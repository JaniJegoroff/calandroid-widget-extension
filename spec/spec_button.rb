require_relative 'spec_helper'

# Test class for Button
class SpecButton < Minitest::Spec
  before do
    @opr = Calabash::Android::Operations
  end

  describe 'Button' do
    describe 'Button.text' do
      it 'should call Calabash query method with correct parameters' do
        @opr.response = %w(varkaus oulu kuopio)

        Button.text.must_equal('varkaus')
        @opr.ui_query.must_equal("#{Button.class_name}")
        @opr.args.first.must_equal(:text)

        Button.text(0).must_equal('varkaus')
        @opr.ui_query.must_equal("#{Button.class_name} index:0")
        @opr.args.first.must_equal(:text)

        Button.text('myId').must_equal('varkaus')
        @opr.ui_query.must_equal("#{Button.class_name} marked:'myId'")
        @opr.args.first.must_equal(:text)
      end
    end

    describe 'Button.selected?' do
      it 'should call Calabash query method with correct parameters' do
        @opr.response = [false, true]
        ret = Button.selected?
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{Button.class_name}")
        @opr.args.first.must_equal(:selected)

        @opr.response = [false, true]
        ret = Button.selected?(0)
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{Button.class_name} index:0")
        @opr.args.first.must_equal(:selected)

        @opr.response = [true, false]
        ret = Button.selected?('myId')
        ret.must_equal(true)
        @opr.ui_query.must_equal("#{Button.class_name} marked:'myId'")
        @opr.args.first.must_equal(:selected)
      end
    end
  end
end
