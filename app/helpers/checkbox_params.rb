module CheckboxParams
  def insurance_params
    ["Insurance 1", "Insurance 2", "Insurance 3", "Insurance 4"]
  end
  
  def waiver_params
    ["Medicaid", "Title 19", "Waiver 1", "Waiver 2"]
  end
  
  def address_params 
    ["Iowa City", "Grinnell", "Des Moines"]
  end
  
  def search_criteria
    ["waiver", "insurance", "address", "practiceName"]
  end
end