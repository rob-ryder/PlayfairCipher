# encoding: UTF-8
describe PcMapper do

  describe '.clean_string' do
    it 'should strip out non-alphabetic characters' do
      expect(described_class.clean_string("1!@A£$%^&*B()_+{}:| <C>?/.,;][=-\\\"'\n\t")).to eql('ABC')
    end
    it 'should transform to upper case' do
      expect(described_class.clean_string("CaseTest")).to match(/^CASETEST$/)
    end
  end

  describe '.valid_string?' do
    it 'should return false if string is empty' do
      expect(described_class.valid_string?('')).to be false
    end
    it 'should return false if string contains non-alphabetic characters' do
      expect(described_class.valid_string?('MESSAGE BROKEN UP. HAS PUNCTUATION!')).to be false
    end
    it 'should return false if string contains lower-case chars' do
      expect(described_class.valid_string?('MessageContainsLowerCaseChars')).to be false
    end
    it 'should return true if string contains only uppercase alphabetic chars' do
      expect(described_class.valid_string?('MESSAGEISFULLYUPPERCASEALPHABETICCHARS')).to be true
    end
  end
  
end