package com.demo.dto;

import java.sql.Time;
import java.time.LocalDate;
import java.util.Date;

public class BookingDTO {
    private int id;
    private int room;
    private Date bookedDate;
    private Time bookedTimeFrom;
    private Time bookedTimeTo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
}
