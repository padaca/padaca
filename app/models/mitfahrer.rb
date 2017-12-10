class Mitfahrer < ActiveRecord::Base
  belongs_to :fahrt
  belongs_to :account
end
