require 'spec_helper'

describe U8::Command do
  context 'no args' do
    let(:git) { U8.command :git }

    it 'returns a U8::Command' do
      expect(git).to be_a(U8::Command)
    end

    it 'sets cmd' do
      expect(git.instance_variable_get(:@cmd)).to eq(:git)
    end

    it 'sets options' do
      expect(git.instance_variable_get(:@options)).to be_a(Hash)
    end

  end

  context 'args' do
    let(:git) { U8.command :git, equals: true }

    it 'sets options' do
      options = git.instance_variable_get(:@options)
      expect(options[:equals]).to eq(true)
    end
  end

  context 'executes' do
    let(:git) { U8.command :git }

    before do
      #allow(git).to_receive(:git)
      git.stub(:exec)#.with(:git, {equals:true})
    end

    it 'execs without options' do
      #expect(git()).to receive(:exec)#.with(:git, {equals:true})
    end

    it 'execs with array options' do
      pending 'implement arrays'
      expect(
        git.call :commit
      ).to receive(:exec).with(:git, {equals:true})

      expect(
        git.call :commit, '--add', '--amend'
      ).to receive(:exec)#.with(:git, {equals:true})
    end

  end

  context 'execs with hash options' do
    let(:curl) { U8.command :curl, { config: 'filename' } }
  end
end
