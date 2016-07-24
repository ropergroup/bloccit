require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:vote) { create(:vote, post: post) }


   it { is_expected.to belong_to(:post) }
   it { is_expected.to belong_to(:user) }

   it { is_expected.to validate_presence_of(:value) }

   it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }
 end
