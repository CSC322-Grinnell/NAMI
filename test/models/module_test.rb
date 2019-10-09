module Test_module_works
    def test_module_works
        assert true
    end
end

module ProviderRespondTest
    def test_provider_responds_to_methods
        assert_respond_to(@object, :waivers)
        assert_respond_to(@object, :address)
        assert_respond_to(@object, :practiceName)
        assert_respond_to(@object, :phone)
        assert_respond_to(@object, :description)
        assert_respond_to(@object, :email)
    end
end
