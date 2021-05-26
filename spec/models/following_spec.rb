require 'rails_helper'

RSpec.describe Following, type: :model do
 context ' Association Test' do
   it 'should belong to a follower' do 
    follow = Following.reflect_on_association(:follower).macro
    expect(follow).to eq(:belongs_to)
   end

   it 'should belong to a followed' do 
    follow = Following.reflect_on_association(:followed).macro
    expect(follow).to eq(:belongs_to)
   end
 end
  
end
