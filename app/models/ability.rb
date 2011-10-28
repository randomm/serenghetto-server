class Ability
  include CanCan::Ability

  def initialize(user)
#    user ||= User.new # guest user (not logged in)
#    can :user_barcodes, Barcode, { :user_id == user.id }
  end
end
