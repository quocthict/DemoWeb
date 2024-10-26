package com.demo.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Child {
    private int id;
    private String first_name;
    private String last_name;
    private int gender;
    private LocalDate birth_date;
    private LocalDateTime created_date;
    private LocalDateTime modified_date;

    public Child(int id, String first_name, String last_name, int gender, LocalDate birth_date, LocalDateTime created_date, LocalDateTime modified_date) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.gender = gender;
        this.birth_date = birth_date;
        this.created_date = created_date;
        this.modified_date = modified_date;
    }

    public int getId() {
        return id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public int getGender() {
        return gender;
    }

    public LocalDate getBirth_date() {
        return birth_date;
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

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public void setBirth_date(LocalDate birth_date) {
        this.birth_date = birth_date;
    }

    public void setCreated_date(LocalDateTime created_date) {
        this.created_date = created_date;
    }

    public void setModified_date(LocalDateTime modified_date) {
        this.modified_date = modified_date;
    }

    @Override
    public String toString() {
        return "Child{" +
                "id=" + id +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", gender=" + gender +
                ", birth_date=" + birth_date +
                ", created_date=" + created_date +
                ", modified_date=" + modified_date +
                '}';
    }
}
