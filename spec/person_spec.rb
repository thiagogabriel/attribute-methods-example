require 'spec_helper'

describe Person do
  describe 'check existent attributes' do
    context 'name' do
      it 'says Thiago name is already taken' do
        person = Person.new(name: 'Thiago')
        expect(person.name_taken?).to be_true
      end

      it 'says Gumercindo name is not taken' do
        person = Person.new(name: 'Gumercindo')
        expect(person.name_taken?).to be_false
      end
    end

    context 'email' do
      it 'says thiago@gmail.com is already taken' do
        person = Person.new(email: 'thiago@gmail.com')
        expect(person.email_taken?).to be_true
      end

      it 'says gomercindo@example.com is not taken' do
        person = Person.new(email: 'gomercindo@example.com')
        expect(person.email_taken?).to be_false
      end
    end
  end
end
