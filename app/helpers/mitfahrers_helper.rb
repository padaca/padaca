module MitfahrersHelper
    def get_mitfahrer(fahrt_id, mitfahrer_id)
        Mitfahrer.find_by(:fahrt_id => fahrt_id, :account_id => mitfahrer_id)
    end
end
