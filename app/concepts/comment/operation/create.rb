module Comment::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model( Comment, :new )
      step Contract::Build(constant: ::Comment::Contract::Create)
    end

    step Subprocess(Present)
    step :assign_show
    step Contract::Validate(key: 'comment')
    step :check_recaptcha
    step Contract::Persist()

    def assign_show(ctx, params:, **)
      ctx[:show] = show = Show.find_by(id: JSON.parse(params.dig('comment', 'show_model'))['id'])
      ctx[:'contract.default'].model.show = show
    end

    def check_recaptcha(ctx, recaptcha:, **)
      unless recaptcha
        ctx[:'contract.default'].errors.messages.merge! 'g-recaptcha-response' => :invalid
        return false
      end
      true
    end
  end
end