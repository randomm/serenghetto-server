class UserLocation < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id

  # set to act as API for JSON responses
  acts_as_api
  
  api_accessible :private do | t |
    t.add :id
    t.add :geom
    t.add :description
  end
  
  api_accessible :public do | t |
    t.add :description
  end

end
