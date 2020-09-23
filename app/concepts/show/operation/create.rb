module Show::Operation
  class Create < Trailblazer::Operation
    step Model( Show, :new )
    step Contract::Build(constant: ::Show::Contract::Create)
    step Contract::Validate()
    step Contract::Persist()
  end
end
