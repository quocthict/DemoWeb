package com.demo.model;

public class StyleType {
    private int numberType;
    private String stringType;

    public StyleType(int numberType, String stringType) {
        this.numberType = numberType;
        this.stringType = stringType;
    }

    public int getNumberType() {
        return numberType;
    }

    public String getStringType() {
        return stringType;
    }

    public void setNumberType(int numberType) {
        this.numberType = numberType;
    }

    public void setStringType(String stringType) {
        this.stringType = stringType;
    }

    @Override
    public String toString() {
        return "StyleType{" +
                "numberType=" + numberType +
                ", stringType='" + stringType + '\'' +
                '}';
    }
}
