package com.demo.model;

import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Date;

public class BookingApi {
    private int id;
    private int childId;
    private int room;
    private Date bookedDate;
    private Time bookedTimeFrom;
    private Time bookedTimeTo;
    private LocalDateTime createdDate;
    private LocalDateTime modifiedDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getChildId() {
        return childId;
    }

    public void setChildId(int childId) {
        this.childId = childId;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public Date getBookedDate() {
        return bookedDate;
    }

    public void setBookedDate(Date bookedDate) {
        this.bookedDate = bookedDate;
    }

    public Time getBookedTimeFrom() {
        return bookedTimeFrom;
    }

    public void setBookedTimeFrom(Time bookedTimeFrom) {
        this.bookedTimeFrom = bookedTimeFrom;
    }

    public Time getBookedTimeTo() {
        return bookedTimeTo;
    }

    public void setBookedTimeTo(Time bookedTimeTo) {
        this.bookedTimeTo = bookedTimeTo;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public LocalDateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }
}
