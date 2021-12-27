/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataobj;

import java.sql.Date;

/**
 *
 * @author LucasBV
 */
public class StudentQuizAnswer {
    private int studentID;
    private int quizSessionID;
    private int quizID;
    private int questionID;
    private int answerID;
    private Date createdDate;
    private Date updatedDate;

    public StudentQuizAnswer() {
    }

    public StudentQuizAnswer(int studentID, int quizSessionID, int quizID, int questionID, int answerID, Date createdDate, Date updatedDate) {
        this.studentID = studentID;
        this.quizSessionID = quizSessionID;
        this.quizID = quizID;
        this.questionID = questionID;
        this.answerID = answerID;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getQuizSessionID() {
        return quizSessionID;
    }

    public void setQuizSessionID(int quizSessionID) {
        this.quizSessionID = quizSessionID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }
    
}
