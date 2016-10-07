require 'rails_helper'
require 'nokogiri'

# Specs in this file have access to a helper object that includes
# the Pagescript::TagsHelper. For example:
#
# describe Pagescript::TagsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
module Pagescript
  RSpec.describe Pagescript::TagsHelper, type: :helper do

    let(:element) { Nokogiri::HTML(output).at('body') }
    let(:attributes) do
      Hash[element.attributes.map do |k,v|
        [k, element.attr(k)]
      end]
    end

    subject { attributes }


    before do
      allow(helper).to receive(:action_name).and_return('test_action')
    end

    describe '#body_tag' do
      context 'when called without a block' do
        let(:output) { helper.body_tag(class: 'foo') }
        it { should include 'data-controller' => 'test' }
        it { should include 'data-action' => 'test_action' }
        it { should include 'data-controller' => 'test' }
        it { should include 'data-action' => 'test_action' }
        it { should include 'class' => 'foo' }
        it "is unclosed" do
          expect(output).to_not match /<\/\s?body>/
        end
      end

      context 'when called with a block' do
        let(:output) do
          helper.body_tag(class: 'foo') do
            helper.content_tag(:p, 'hello world')
          end
        end
        it { should include 'data-controller' => 'test' }
        it { should include 'data-action' => 'test_action' }
        it { should include 'class' => 'foo' }
        it "yeilds the block" do
          expect(element.at('p').text).to eq "hello world"
        end
        it "is closed" do
          expect(output).to match /<\/\s?body>/
        end
      end

      context "when called with options for data attributes" do
        let(:output) do
          helper.body_tag(data: { foo: 'bar' })
        end
        it { should include 'data-foo' => 'bar' }
        it { should include 'data-controller' => 'test' }
        it { should include 'data-action' => 'test_action' }
      end
    end
  end
end
