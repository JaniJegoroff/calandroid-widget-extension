require_relative 'spec_helper'

class SpecTextView < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'TextView' do
    describe 'TextView.text' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = %w(varkaus oulu kuopio)

        TextView.text.must_equal('varkaus')
        $uiquery.must_equal("#{TextView.class_name}")
        $args.first.must_equal(:text)

        TextView.text(0).must_equal('varkaus')
        $uiquery.must_equal("#{TextView.class_name} index:0")
        $args.first.must_equal(:text)

        TextView.text('myId').must_equal('varkaus')
        $uiquery.must_equal("#{TextView.class_name} marked:'myId'")
        $args.first.must_equal(:text)
      end
    end
  end
end
