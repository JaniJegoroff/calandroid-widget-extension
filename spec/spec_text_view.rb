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
    describe 'TextView.class_name' do
      it 'should return class name' do
        TextView.class_name.must_equal('TextView')
      end
    end

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

    describe 'TextView.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        TextView.touch
        $uiquery.must_equal("#{TextView.class_name}")

        TextView.touch(0)
        $uiquery.must_equal("#{TextView.class_name} index:0")

        TextView.touch('myId')
        $uiquery.must_equal("#{TextView.class_name} marked:'myId'")

        TextView.tap
        $uiquery.must_equal("#{TextView.class_name}")

        TextView.tap(0)
        $uiquery.must_equal("#{TextView.class_name} index:0")

        TextView.tap('myId')
        $uiquery.must_equal("#{TextView.class_name} marked:'myId'")
      end
    end

    describe 'TextView.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        TextView.property(:finland)
        $uiquery.must_equal("#{TextView.class_name}")
        $args.first.must_equal(:finland)

        TextView.prop(:finland)
        $uiquery.must_equal("#{TextView.class_name}")
        $args.first.must_equal(:finland)

        TextView.p(:finland)
        $uiquery.must_equal("#{TextView.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'TextView.id' do
      it 'should call Calabash query method with correct parameters' do
        TextView.id
        $uiquery.must_equal("#{TextView.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
