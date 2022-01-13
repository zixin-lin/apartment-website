package models;

public class UserModel {

    String name;
    String password;
    String fname;
    String lname;
    int authority;

    public UserModel(String uname, String pwd, String fname, String lname, int authority) {
        this.name = uname;
        this.password = pwd;
        this.fname = fname;
        this.lname = lname;
        this.authority = authority;
    }

    public UserModel(String uname, String fname, String lname, int authority) {
        this.name = uname;
        this.fname = fname;
        this.lname = lname;
        this.authority = authority;
    }

    public UserModel(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public int getAuthority() {
        return authority;
    }
}
