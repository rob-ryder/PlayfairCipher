# encoding: UTF-8
describe PcMessage do

  let(:plain_message){'The quick brown fox jumps over the lazy dog.'}
  let(:message_pairs){['TH','EQ','UI','CK','BR','OW','NF','OX','JU','MP','SO','VE','RT','HE','LA','ZY','DO','GX']}
  
  describe '.valid?' do
    it 'should return false if string is empty' do
      expect(described_class.valid?('')).to be false
    end
    it 'should return false if string contains non-alphabetic characters' do
      expect(described_class.valid?('MESSAGE BROKEN UP. HAS PUNCTUATION!')).to be false
    end
    it 'should return false if string contains lower-case chars' do
      expect(described_class.valid?('MessageContainsLowerCaseChars')).to be false
    end
    it 'should return true if string contains only uppercase alphabetic chars' do
      expect(described_class.valid?('MESSAGEISFULLYUPPERCASEALPHABETICCHARS')).to be true
    end
  end
  
  describe '#initialize' do
    it 'should raise an error if the given string can NOT be cleaned into a valid string' do
      expect{described_class.new('123')}.to raise_error
    end
  end
  
  describe '#clean' do
    it 'should strip out non-alphabetic characters' do
      expect(described_class.new("1!@A£$%^&*B()_+{}:| <C>?/.,;][=-\\\"'\n\t").clean).to eql('ABC')
    end
    it 'should transform to upper case' do
      expect(described_class.new('CaseTest').clean).to match(/^CASETEST$/)
    end
  end
  
  describe '#character_pairs' do
    it 'should return an array' do
      return_val = described_class.new(plain_message).character_pairs
      expect(return_val).to be_an_instance_of(Array)
    end
    it 'should return the correct message parts for it\'s message' do
      return_val = described_class.new(plain_message).character_pairs
      expect(return_val).to eql(message_pairs)
    end
  end
  
end