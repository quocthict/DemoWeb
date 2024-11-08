package com.demo.dto;

import java.util.List;

public class ContactDTO {
    private int id;
    private String fullName;
    private String relationship;
    private List<ChildDTO> childDTOList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public List<ChildDTO> getChildDTOList() {
        return childDTOList;
    }

    public void setChildDTOList(List<ChildDTO> childDTOList) {
        this.childDTOList = childDTOList;
    }
}
