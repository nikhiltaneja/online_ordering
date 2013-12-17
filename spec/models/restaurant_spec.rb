require 'spec_helper'

describe Restaurant do
  let!(:restaurant){ Restaurant.create(name:"billy's bbq", description: "asdf") }

  describe 'before validations' do
    it 'creates a slug' do
      r = Restaurant.new(name:"BBQ")
      r.save
      expect(r.slug).to eq("bbq")
    end
  end

  describe 'validations' do
    context 'duplicate names' do
      it 'is invalid' do
        r2 = Restaurant.create(name:"billy's bbq", description: "asdf")
        expect(r2).to be_invalid
      end
      it 'has errors' do
        r2 = Restaurant.create(name:"billy's bbq", description: "asdf")
        expect(r2).to have(1).error_on(:name)
      end
    end

    context 'similar names' do
      it 'is invalid' do
        r2 = Restaurant.create(name:"billy s bbq", description: "asdf")
        expect(r2).to be_invalid
      end
      it 'has errors' do
        r2 = Restaurant.create(name:"billy s bbq", description: "asdf")
        expect(r2).to have(1).error_on(:slug)
      end
    end

    context 'with display as show and rejected status' do
      it 'is has an error' do
        restaurant.status = 'rejected'
        restaurant.display = true
        restaurant.save
        expect(restaurant).to have(1).error_on(:display)
      end
    end
  end
end
