require 'spec_helper'
require 'css_class_string/view_helpers'

describe "CssClassString::Helper" do
  describe ".to_s" do

    context "when a key's value is truthy" do
      let(:hash) { {truthy: true} } 
      subject { CssClassString::Helper.new(hash).to_s } 
      
      it { is_expected.to eq("truthy") }
    end

    context "when a key's value is falsy" do
      let(:hash) { {falsy: false} } 
      subject { CssClassString::Helper.new(hash).to_s } 
      
      it { is_expected.to eq("") }
    end

    context "when a key is an array of two elements" do

      context "when value is truthy" do
        let(:hash) { {[:truthy, :falsy] => true} } 
        subject { CssClassString::Helper.new(hash).to_s } 
        
        it { is_expected.to eq("truthy") }
      end

      context "when value is falsy" do
        let(:hash) { {[:truthy, :falsy] => false} } 
        subject { CssClassString::Helper.new(hash).to_s } 
        
        it { is_expected.to eq("falsy") }
      end
      
    end

    context 'when multiple keys are given' do

      let(:hash) {
        {
          [:arr_truthy, :arr_falsy] => false,
          :str_truthy => true,
          :str_falsy => false
        }
      }
      subject { CssClassString::Helper.new(hash).to_s }

      it { is_expected.to match(/^\w+ \w+$/) }
      it { is_expected.to include('arr_falsy', 'str_truthy') }
      it { is_expected.not_to include('arr_truthy', 'str_falsy') }

    end

    context 'with truthy arguments only' do
      subject { CssClassString::Helper.new('truthy_1', 'truthy_2').to_s }
      it { is_expected.to eq('truthy_1 truthy_2') }
    end

    context 'with mixed arguments' do
      subject { CssClassString::Helper.new('truthy_1', 'truthy_2', falsy: false, truthy_3: true).to_s }
      it { is_expected.to eq('truthy_1 truthy_2 truthy_3') }
    end

  end
end
