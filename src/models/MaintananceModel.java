package models;

public class MaintananceModel {

    int uid;
    String description;
    int year;
    int month;
    int day;
    int fyear;
    int fmonth;
    int fday;
    boolean status;
    UserModel userModel;

    public MaintananceModel(int uid, String description, int year, int month, int day, int fyear, int fmonth, int fday, boolean status) {
        this.uid = uid;
        this.description = description;
        this.year = year;
        this.month = month;
        this.day = day;
        this.fyear = fyear;
        this.fmonth = fmonth;
        this.fday = fday;
        this.status = status;
    }

    public MaintananceModel(int uid, String description, int year, int month, int day, boolean status) {
        this.uid = uid;
        this.description = description;
        this.year = year;
        this.month = month;
        this.day = day;
        this.status = status;
    }

    public MaintananceModel(String description, int year, int month, int day, boolean status) {
        this.description = description;
        this.year = year;
        this.month = month;
        this.day = day;
        this.status = status;
    }

    public MaintananceModel(String description, int year, int month, int day, int fyear, int fmonth, int fday, boolean status) {
        this.description = description;
        this.year = year;
        this.month = month;
        this.day = day;
        this.fyear = fyear;
        this.fmonth = fmonth;
        this.fday = fday;
        this.status = status;
    }

    public MaintananceModel(int uid, String description) {
        this.uid = uid;
        this.description = description;
    }

    public int getUid() {
        return uid;
    }

    public String getDescription() {
        return description;
    }

    public int getYear() {
        return year;
    }

    public int getMonth() {
        return month;
    }

    public int getDay() {
        return day;
    }

    public boolean getStatus() {
        return status;
    }

    public int getFyear() {
        return fyear;
    }

    public int getFmonth() {
        return fmonth;
    }

    public int getFday() {
        return fday;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public UserModel getUserModel() {
        return userModel;
    }
}
