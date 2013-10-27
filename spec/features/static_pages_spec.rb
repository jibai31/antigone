require 'spec_helper'

feature "Home page" do
  subject { page }
  before { visit '/' }
  it { should have_content('PolitiQA') }
  it { should have_title('PolitiQA') }
end

feature "About page" do
  subject { page }
  before { visit '/about' }
  it { should have_content('A propos') }
  it { should have_title('A propos - PolitiQA') }
end
