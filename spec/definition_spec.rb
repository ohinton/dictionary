require('rspec')
require('definition')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe('.all') do
    it('is empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a definition to the array of saved defintions') do
      test_definition = Definition.new(:definition => 'a small domesticated carnivorous mammal with soft fur and retractile claws.')
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe('.clear') do
    it('empties out all saved definitions') do
      Definition.new(:definition => 'a small domesticated carnivorous mammal with soft fur and retractile claws.').save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('.find') do
    it ('returns a definition by its id number') do
      test_definition = Definition.new(:definition => 'a small domesticated carnivorous mammal with soft fur and retractile claws.')
      test_definition.save()
      test_definition2 = Definition.new(:definition => 'informally, particularly among jazz enthusiasts, a person, especially a man.')
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end


end
