describe PlayfairCipher do

  let(:invalid_key_string) {
    'Invalid key here.'
  }
  let(:valid_key_string) {
    'VALIDKEYHERE'
  }
  let(:obj){
    described_class.new(valid_key_string)
  }
  
  describe '#initialize' do
    it 'raises an error if not given a valid key string' do
      expect{described_class.new(invalid_key_string)}.to raise_error
    end
    it "returns an instance of #{described_class} when given a valid key string" do
      expect(described_class.new(valid_key_string)).to be_an_instance_of(described_class)
    end
  end
  
  describe '#encrypt' do
    it 'returns the given string correctly encrypted with the Playfair Cipher' do
      expect(obj.encrypt('PLEASEREADMYSIMPLEMESSAGE')).to eql('WYCEORKYLVFRQDFSAYCRQZICHU')
    end
  end

  describe '#decrypt' do
    it 'returns the given string correctly decrypted with the Playfair Cipher' do
      expect(obj.decrypt('WYCEORKYLVFRQDFSAYCRQZICHU')).to eql('PLEASEREADMYSIMPLEMESXAGEX')
    end
  end
  
end