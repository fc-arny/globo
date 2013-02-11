module Common
  # -------------------------------------------------------------
  # Show base or static pages
  # -------------------------------------------------------------
  class IndexController < ApplicationController
    # -------------------------------------------------------------
    # Show main page
    # -------------------------------------------------------------
    def main
      @users = Sap::User.restrict(current_user).order('id DESC')
      #sms_gate = SmsGate::SMSC.new
      #@ret = sms_gate.send_sms('79091553336', 'Hallo Globo!',0,0,0,0, 'MartSoft')
    end
  end
end
