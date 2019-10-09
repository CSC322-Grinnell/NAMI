module LoginHelper
  def a_user
    User.create!(email: "shelby@grinnell.edu", admin: false, password: "1234567")
  end

  def an_admin
    User.create(email: "shelby2000@outlook.com", admin: true, encrypted_password: User.new.send(:password_digest, '1234567'))
  end
end
