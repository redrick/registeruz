RSpec.describe 'Errors' do
  it 'defines all necessarry error classes' do
    expect { Registeruz::Error }.not_to raise_error
    expect { Registeruz::NotFound }.not_to raise_error
  end
end
