module NachrichtsHelper

    def unread_nachrichts_class
        return unless current_account
        if Nachricht.where(empfaenger_id: current_account.id, read: nil).count > 0
            :unread
        end
    end
end
