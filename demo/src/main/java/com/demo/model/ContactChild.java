package com.demo.model;

import java.time.LocalDateTime;

public class ContactChild {
    private int id;
    private int contact_id;
    private int child_id;
    private LocalDateTime created_date;
    private LocalDateTime modified_date;

    public ContactChild(int id, int contact_id, int child_id, LocalDateTime created_date, LocalDateTime modified_date) {
        this.id = id;
        this.contact_id = contact_id;
        this.child_id = child_id;
        this.created_date = created_date;
        this.modified_date = modified_date;
    }

    public int getId() {
        return id;
    }

    public int getContact_id() {
        return contact_id;
    }

    public int getChild_id() {
        return child_id;
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

    public void setContact_id(int contact_id) {
        this.contact_id = contact_id;
    }

    public void setChild_id(int child_id) {
        this.child_id = child_id;
    }

    public void setCreated_date(LocalDateTime created_date) {
        this.created_date = created_date;
    }

    public void setModified_date(LocalDateTime modified_date) {
        this.modified_date = modified_date;
    }

    @Override
    public String toString() {
        return "ContactChild{" +
                "id=" + id +
                ", contact_id=" + contact_id +
                ", child_id=" + child_id +
                ", created_date=" + created_date +
                ", modified_date=" + modified_date +
                '}';
    }
}
