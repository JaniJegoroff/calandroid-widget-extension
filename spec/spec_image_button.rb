require_relative 'spec_helper'

# Test class for IamgeButton
class SpecImageButton < Minitest::Spec
  before do
    @opr = Calabash::Android::Operations
  end

  describe 'ImageButton' do
    describe 'ImageButton.selected?' do
      it 'should call Calabash query method with correct parameters' do
        @opr.response = [false, true]
        ret = ImageButton.selected?
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{ImageButton.class_name}")
        @opr.args.first.must_equal(:selected)

        @opr.response = [false, true]
        ret = ImageButton.selected?(0)
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{ImageButton.class_name} index:0")
        @opr.args.first.must_equal(:selected)

        @opr.response = [true, false]
        ret = ImageButton.selected?('myId')
        ret.must_equal(true)
        @opr.ui_query.must_equal("#{ImageButton.class_name} marked:'myId'")
        @opr.args.first.must_equal(:selected)
      end
    end

    describe 'ImageButton.activated?' do
      it 'should call Calabash query method with correct parameters' do
        @opr.response = [false, true]
        ret = ImageButton.activated?
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{ImageButton.class_name}")
        @opr.args.first.must_equal(:activated)

        @opr.response = [false, true]
        ret = ImageButton.activated?(0)
        ret.must_equal(false)
        @opr.ui_query.must_equal("#{ImageButton.class_name} index:0")
        @opr.args.first.must_equal(:activated)

        @opr.response = [true, false]
        ret = ImageButton.activated?('myId')
        ret.must_equal(true)
        @opr.ui_query.must_equal("#{ImageButton.class_name} marked:'myId'")
        @opr.args.first.must_equal(:activated)
      end
    end
  end
end
