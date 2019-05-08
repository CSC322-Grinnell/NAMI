module LoginProcess
    # methods that wrap the behavior of creating a user/admin
    def a_user
        User.new(email: "qinyi@grinnell.edu", admin: false, encrypted_password: User.new.send(:password_digest, '1234567'))
    end
    
    def an_admin
        User.new(email: "qinyi2000@outlook.com", admin: true, encrypted_password: User.new.send(:password_digest, '1234567'))
    end
end