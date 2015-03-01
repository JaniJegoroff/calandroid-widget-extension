require_relative 'spec_helper'

# Test class for TextView
class SpecTextView < Minitest::Spec
  before do
    @opr = Calabash::Android::Operations
  end

  describe 'TextView' do
    describe 'TextView.text' do
      it 'should call Calabash query method with correct parameters' do
        @opr.response = %w(varkaus oulu kuopio)

        TextView.text.must_equal('varkaus')
        @opr.ui_query.must_equal("#{TextView.class_name}")
        @opr.args.first.must_equal(:text)

        TextView.text(0).must_equal('varkaus')
        @opr.ui_query.must_equal("#{TextView.class_name} index:0")
        @opr.args.first.must_equal(:text)

        TextView.text('myId').must_equal('varkaus')
        @opr.ui_query.must_equal("#{TextView.class_name} marked:'myId'")
        @opr.args.first.must_equal(:text)
      end
    end
  end
end
