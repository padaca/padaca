module MitfahrersHelper
    def get_mitfahrer(fahrt_id, mitfahrer_id)
        Mitfahrer.find_by(:fahrt_id => fahrt_id, :account_id => mitfahrer_id)
    end

    def mitfahrer_counterpart(mitfahrer)
        counterpart = case @counterpart
        when :fahrer
            mitfahrer.fahrt.account
        when :mitfahrer
            mitfahrer.account
        end

        link_to counterpart
    end
end
