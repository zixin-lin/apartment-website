package models;

public class BillModel {

    int userid;
    int amount;
    int rental;
    int power;
    int tax;
    int month;
    int year;

    public BillModel(int userid, int amount, int rental, int power, int tax, int month, int year) {
        this.userid = userid;
        this.amount = amount;
        this.rental = rental;
        this.power = power;
        this.tax = tax;
        this.month = month;
        this.year = year;
    }

    public BillModel(int amount, int rental, int power, int tax, int month, int year) {
        this.amount = amount;
        this.rental = rental;
        this.power = power;
        this.tax = tax;
        this.month = month;
        this.year = year;
    }

    public int getUserid() {
        return userid;
    }

    public int getAmount() {
        return amount;
    }

    public int getRental() {
        return rental;
    }

    public int getPower() {
        return power;
    }

    public int getTax() {
        return tax;
    }

    public int getMonth() {
        return month;
    }

    public int getYear() {
        return year;
    }
}
