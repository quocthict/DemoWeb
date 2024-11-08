package com.demo.model;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class Booking {
    private int id;
    private int child_id;
    private int room;
    private LocalDate booked_date;
    private Time booked_time_from;
    private Time booked_time_to;
    private LocalDateTime created_date;
    private LocalDateTime modified_date;

    public Booking(int id, int child_id, int room, LocalDate booked_date, Time booked_time_from, Time booked_time_to, LocalDateTime created_date, LocalDateTime modified_date) {
        this.id = id;
        this.child_id = child_id;
        this.room = room;
        this.booked_date = booked_date;
        this.booked_time_from = booked_time_from;
        this.booked_time_to = booked_time_to;
        this.created_date = created_date;
        this.modified_date = modified_date;
    }

    public Booking(int id, int room, LocalDate booked_date, Time booked_time_from, Time booked_time_to) {
        this.id = id;
        this.room = room;
        this.booked_date = booked_date;
        this.booked_time_from = booked_time_from;
        this.booked_time_to = booked_time_to;
    }

    public int getId() {
        return id;
    }

    public int getChild_id() {
        return child_id;
    }

    public int getRoom() {
        return room;
    }

    public LocalDate getBooked_date() {
        return booked_date;
    }

    public Time getBooked_time_from() {
        return booked_time_from;
    }

    public Time getBooked_time_to() {
        return booked_time_to;
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

    public void setChild_id(int child_id) {
        this.child_id = child_id;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public void setBooked_date(LocalDate booked_date) {
        this.booked_date = booked_date;
    }

    public void setBooked_time_from(Time booked_time_from) {
        this.booked_time_from = booked_time_from;
    }

    public void setBooked_time_to(Time booked_time_to) {
        this.booked_time_to = booked_time_to;
    }

    public void setCreated_date(LocalDateTime created_date) {
        this.created_date = created_date;
    }

    public void setModified_date(LocalDateTime modified_date) {
        this.modified_date = modified_date;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", child_id=" + child_id +
                ", room=" + room +
                ", booked_date=" + booked_date +
                ", booked_time_from=" + booked_time_from +
                ", booked_time_to=" + booked_time_to +
                ", created_date=" + created_date +
                ", modified_date=" + modified_date +
                '}';
    }
}
