package com.demo.model;

import java.sql.Time;
import java.time.LocalDateTime;

public class SignApi {
    private int id;
    private int contactId;
    private int bookingId;
    private boolean type;
    private Time signTime;
    private String signature;
    private LocalDateTime createdDate;
    private LocalDateTime modifiedDate;

}
