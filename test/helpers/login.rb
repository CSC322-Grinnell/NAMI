module LoginProcess
    # uses gem 'mocha' to create stubs for testing
    def log_user_in
        ApplicationController.any_instance.stubs(:current_user).returns(User.new(admin: false, email: "qinyi@grinnell.edu", encrypted_password: User.new.send(:password_digest, '1234567')))
    end
    
    def log_admin_in
        ApplicationController.any_instance.stubs(:current_user).returns(User.new(admin: true, email: "qinyi2000@outlook.com", encrypted_password: User.new.send(:password_digest, '1234567')))
    end
end