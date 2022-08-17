class ValidatedAddressForm < Reform::Form
  property :select_address, populator: -> { self.which_address = 1 }
end

