module OAuthIntegrationTestHelper
    def login_with_oauth(service = :testService)
        visit "/auth/#{service}"
    end
end