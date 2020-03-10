require 'rails_helper'

RSpec.describe Event, type: :model do
  #it { is_expected.to validate_presence_of :name }


  it 'validates presence of name' do
    event = Event.new(name: 'demodemo')
    expect(event.name).not_to be_nil
  end

  
end
