module LoginHelper
  def a_user
    User.create(email: "shelby@grinnell.edu", admin: false, password: "1234567")
    Provider.create(practiceName: "Provider1",
                    address: "1234 Example Street",
                    phone: "111-111-1111",
                    description: "An example provider",
                    user: User.find_by_email("shelby@grinnell.edu"))
    @user = User.find_by_email("shelby@grinnell.edu")
    return @user
  end

  def an_admin
    User.create(email: "shelby2000@outlook.com", admin: true, password: "123456789")
    Provider.create(practiceName: "Provider1",
                                  address: "1234 Example Street",
                                  phone: "111-111-1111",
                                  description: "An example provider",
                                  user: User.find_by_email("shelby2000@outlook.com"))
    @user = User.find_by_email("shelby2000@outlook.com")
    return @user
  end
end
