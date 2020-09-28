module Show::Operation
  class Create < Trailblazer::Operation

    class Present < Trailblazer::Operation
      step Model( Show, :new )
      step Contract::Build(constant: ::Show::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: 'show')
    pass :check_recaptcha
    step :modify_planned_for
    step :assign_geocoordinates
    step Contract::Persist()
    step :attach_image

    def check_recaptcha(ctx, recaptcha:, **)
      #unless recaptcha
      #  ctx[:'contract.default'].errors.messages.merge! 'g-recaptcha-response' => :invalid
      #  return false
      #end
      true
    end

    def modify_planned_for(ctx, params:, **)
      if ctx[:'contract.default'].planned_for.blank?
        year = params.dig('show', 'planned_for(1i)').to_i
        month = params.dig('show', 'planned_for(2i)').to_i
        day = params.dig('show', 'planned_for(3i)').to_i
        ctx[:'contract.default'].planned_for = Date.new(year, month, day)
      end
    end

    def assign_geocoordinates(ctx, **)
      city = ctx[:'contract.default'].city
      results = Geocoder.search(city)
      if results.first&.coordinates.blank?
        ctx[:'contract.default'].errors.messages.merge! 'city' => :no_coordinates_found
        return false
      end
      latitude, longitude = results.first.coordinates
      ctx[:'contract.default'].latitude = latitude
      ctx[:'contract.default'].longitude = longitude
    end

    def attach_image(ctx, model:, params:, **)
      flyer = params.dig('show', 'flyer')
      model.flyer.attach(flyer)
    end
  end
end
