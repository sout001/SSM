package com.zking.SSM.home.model;

import lombok.ToString;

import java.util.Objects;

/**
 * create by CSQ on 2019-12-30
 */
@ToString
public class UserinfoModel {
    private Integer id;
    private Integer version;
    private Integer bitState;
    private String realName;
    private Integer score;
    private Integer realAuthId;
    private String idNumber;
    private String phoneNumber;
    private Integer incomeGradeId;
    private Integer marriageId;
    private Integer kidCountId;
    private Integer educationBackgroundId;
    private Integer houseConditionId;
    private String email;

    private String passWord;

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getBitState() {
        return bitState;
    }

    public void setBitState(Integer bitState) {
        this.bitState = bitState;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getRealAuthId() {
        return realAuthId;
    }

    public void setRealAuthId(Integer realAuthId) {
        this.realAuthId = realAuthId;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getIncomeGradeId() {
        return incomeGradeId;
    }

    public void setIncomeGradeId(Integer incomeGradeId) {
        this.incomeGradeId = incomeGradeId;
    }

    public Integer getMarriageId() {
        return marriageId;
    }

    public void setMarriageId(Integer marriageId) {
        this.marriageId = marriageId;
    }

    public Integer getKidCountId() {
        return kidCountId;
    }

    public void setKidCountId(Integer kidCountId) {
        this.kidCountId = kidCountId;
    }

    public Integer getEducationBackgroundId() {
        return educationBackgroundId;
    }

    public void setEducationBackgroundId(Integer educationBackgroundId) {
        this.educationBackgroundId = educationBackgroundId;
    }

    public Integer getHouseConditionId() {
        return houseConditionId;
    }

    public void setHouseConditionId(Integer houseConditionId) {
        this.houseConditionId = houseConditionId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserinfoModel that = (UserinfoModel) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(version, that.version) &&
                Objects.equals(bitState, that.bitState) &&
                Objects.equals(realName, that.realName) &&
                Objects.equals(score, that.score) &&
                Objects.equals(realAuthId, that.realAuthId) &&
                Objects.equals(idNumber, that.idNumber) &&
                Objects.equals(phoneNumber, that.phoneNumber) &&
                Objects.equals(incomeGradeId, that.incomeGradeId) &&
                Objects.equals(marriageId, that.marriageId) &&
                Objects.equals(kidCountId, that.kidCountId) &&
                Objects.equals(educationBackgroundId, that.educationBackgroundId) &&
                Objects.equals(houseConditionId, that.houseConditionId) &&
                Objects.equals(email, that.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, version, bitState, realName, score, realAuthId, idNumber, phoneNumber, incomeGradeId, marriageId, kidCountId, educationBackgroundId, houseConditionId, email);
    }
}
