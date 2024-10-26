package com.demo.model;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class Sign {
    private int id;
    private int booking_id;
    private int contact_id;
    private int type;
    private Time sign_time;
    private String signature;
    private LocalDateTime created_date;
    private LocalDateTime modified_date;

    public Sign(int id, int booking_id, int contact_id, int type, LocalTime sign_time, String signature, LocalDateTime created_date, LocalDateTime modified_date) {
        this.id = id;
        this.booking_id = booking_id;
        this.contact_id = contact_id;
        this.type = type;
        this.sign_time = Time.valueOf(sign_time);
        this.signature = signature;
        this.created_date = created_date;
        this.modified_date = modified_date;
    }

    public int getId() {
        return id;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public int getContact_id() {
        return contact_id;
    }

    public int getType() {
        return type;
    }

    public LocalTime getSign_time() {
        return sign_time.toLocalTime();
    }

    public String getSignature() {
        return signature;
    }

    public LocalDateTime getCreated_date() {
        return created_date;
    }

    public LocalDateTime getModified_date() {
        return modified_date;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setSign_time(LocalTime sign_time) {
        this.sign_time = Time.valueOf(sign_time);
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public void setCreated_date(LocalDateTime created_date) {
        this.created_date = created_date;
    }

    public void setModified_date(LocalDateTime modified_date) {
        this.modified_date = modified_date;
    }

    @Override
    public String toString() {
        return "Sign{" +
                "id=" + id +
                ", booking_id=" + booking_id +
                ", contact_id=" + contact_id +
                ", type=" + type +
                ", sign_time=" + sign_time +
                ", signature=" + signature +
                ", created_date=" + created_date +
                ", modified_date=" + modified_date +
                '}';
    }
}
