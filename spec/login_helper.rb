module LoginHelper
  def a_user
    User.create(email: "qinyi@grinnell.edu", admin: false, encrypted_password: User.new.send(:password_digest, '1234567'))
  end

  def an_admin
    User.create(email: "qinyi2000@outlook.com", admin: true, encrypted_password: User.new.send(:password_digest, '1234567'))
  end
end
