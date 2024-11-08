package com.demo.model;

public class Contact {
    private int id;
    private String first_name;
    private String last_name;
    private String relationship;

    public int getId() {
        return id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getRelationship() {
        return relationship;
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

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public Contact() {
    }

    public Contact(int id, String first_name, String last_name, String relationship) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.relationship = relationship;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "id=" + id +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", relationship='" + relationship + '\'' +
                '}';
    }
}
