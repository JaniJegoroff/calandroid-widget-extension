require_relative 'spec_helper'

class SpecLinearLayout < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'LinearLayout' do
    describe 'LinearLayout.class_name' do
      it 'should return class name' do
        LinearLayout.class_name.must_equal('LinearLayout')
      end
    end

    describe 'LinearLayout.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        LinearLayout.touch
        $uiquery.must_equal("#{LinearLayout.class_name}")

        LinearLayout.touch(0)
        $uiquery.must_equal("#{LinearLayout.class_name} index:0")

        LinearLayout.touch('myId')
        $uiquery.must_equal("#{LinearLayout.class_name} marked:'myId'")

        LinearLayout.tap
        $uiquery.must_equal("#{LinearLayout.class_name}")

        LinearLayout.tap(0)
        $uiquery.must_equal("#{LinearLayout.class_name} index:0")

        LinearLayout.tap('myId')
        $uiquery.must_equal("#{LinearLayout.class_name} marked:'myId'")
      end
    end

    describe 'LinearLayout.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        LinearLayout.property(:finland)
        $uiquery.must_equal("#{LinearLayout.class_name}")
        $args.first.must_equal(:finland)

        LinearLayout.prop(:finland)
        $uiquery.must_equal("#{LinearLayout.class_name}")
        $args.first.must_equal(:finland)

        LinearLayout.p(:finland)
        $uiquery.must_equal("#{LinearLayout.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'LinearLayout.id' do
      it 'should call Calabash query method with correct parameters' do
        LinearLayout.id
        $uiquery.must_equal("#{LinearLayout.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
