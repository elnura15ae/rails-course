require 'rails_helper'

RSpec.describe Order, type: :model do 
    it 'belongs_to' do
        should belong_to :user 
    end 
end 