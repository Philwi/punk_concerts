module Contact::Operation
  class Create < Trailblazer::Operation
    class Flash
      def self.call(result)
        if result.success?
          { notice: I18n.t('flash.contact_created') }
        elsif result[:error].present?
          { alert: I18n.t('flash.contact_not_created') }
        end
      end
    end
    class Present < Trailblazer::Operation
      step Model(Contact, :new)
      step Contract::Build(constant: ::Contact::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: 'contact')
    step :check_recaptcha
    step Contract::Persist()

    def check_recaptcha(ctx, recaptcha:, **)
      unless recaptcha
        ctx[:'contract.default'].errors.messages.merge! 'g-recaptcha-response' => :invalid
        return false
      end
      true
    end
  end
end