require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it('returns the user provided word') do
      test_word = Word.new(:word => 'cat')
      expect(test_word.word()).to(eq('cat'))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      test_word = Word.new(:word => 'cat')
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#definitions') do
    it('initially returns an empty array of definitions for the word') do
      test_word = Word.new(:word => 'cat')
      expect(test_word.definitions()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a word to the array of saved words') do
      test_word = Word.new(:word => 'cat')
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties all saved words and their definitions') do
      Word.new(:word => 'cat').save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('returns a word by its id number') do
      test_word = Word.new(:word => 'cat')
      test_word.save()
      test_word2 = Word.new(:word => 'dog')
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end



end
