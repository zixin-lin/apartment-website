package models;

public class FeedbackModel {

    int uid;
    String feedback;
    int year;
    int month;
    int day;
    UserModel userModel;

    public FeedbackModel(int uid, String feedback, int year, int month, int day) {
        this.uid = uid;
        this.feedback = feedback;
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public FeedbackModel(String feedback, int year, int month, int day) {
        this.feedback = feedback;
        this.year = year;
        this.month = month;
        this.day = day;
    }

    public FeedbackModel(int uid, String feedback) {
        this.uid = uid;
        this.feedback = feedback;
    }

    public int getUid() {
        return uid;
    }

    public String getFeedback() {
        return feedback;
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

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }
}
