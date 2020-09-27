module Show::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model( Show, :new )
      step Contract::Build(constant: ::Show::Contract::Create)
    end

    step Subprocess(Present)
    step Contract::Validate(key: 'show')
    step Contract::Persist()
  end
end
