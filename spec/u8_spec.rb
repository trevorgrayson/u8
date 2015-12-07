require 'spec_helper'

describe U8 do
  it 'concats string args' do
    #expect(args_to_s 'var1=val1', 'var2=val2').to be("var1=val1 var2=val2")
  end

  context 'equals' do
    let(:options){ {equals: true} }

    it 'puts equals on args' do
      expect(
        args_to_s(options, {
          var1: :val1, 
          var2: :val2
        })
      ).to eq("var1=val1 var2=val2")
    end

  end

  context 'equals and prefix' do
    let(:options){ {equals: true, prefix: '--'} }

    it 'puts equals and prefix on args' do
      expect(
        args_to_s(options, {
          var1: :val1, 
          var2: :val2
        })
      ).to eq("--var1=val1 --var2=val2")
    end

  end

  def args_to_s options, args
    U8.class_eval do
      args_to_s options, args
    end
  end
end
